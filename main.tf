provider "aws" {
  region     = "us-east-1"
  access_key = "******8"    # Replace with your AWS access key ID
  secret_key = "ElH*******************PscV"    # Replace with your AWS secret access key
}

variable "aws_region" {
  description = "AWS region"
  default     = "us-east-1"  # Replace with your desired region
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}  

variable "subnet_cidr_blocks" {
  description = "CIDR blocks for the subnets"
  type        = list(string)
  default     = ["10.0.1.0/24"]  # Replace with your desired subnets
}

variable "ami_id" {
  description = "Ubuntu AMI ID"
  default     = "ami-0b4750268a88e78e0"  # Replace with your desired Ubuntu AMI ID
}

variable "key_name" {
  description = "EC2 key pair name"
  default     = "terraform"  # Replace with your EC2 key pair name
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"  # Replace with your desired instance type
}

resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block
  enable_dns_support = true
  enable_dns_hostnames = true
}
resource "aws_subnet" "subnet" {
  count             = length(var.subnet_cidr_blocks)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet_cidr_blocks[count.index]
  availability_zone = "us-east-1a"  # Replace with a valid availability zone

  tags = {
    Name = "subnet-${count.index + 1}"
  }
}


resource "aws_security_group" "web_server" {
  name        = "WebServerSG"
  description = "Security group for web servers"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "web_server" {
  count         = length(var.subnet_cidr_blocks)
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.subnet[count.index].id
  key_name      = var.key_name
  security_groups = [aws_security_group.web_server.id]
  associate_public_ip_address = true

}
