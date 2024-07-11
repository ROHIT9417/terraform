Problem statement--You have been asked to build an infrastructure safely and efficiently. 
The company Requirements:
 1. Use AWS cloud Provider and the software to be installed is Apache2 
2. Use Ubuntu AMI 

The company wants the Architecture to have the following services:
 1. Create a template with a VPC, 2 subnets and 1 instance in each subnet 
2. Attach Security groups, internet gateway and network interface to the instance
**********************************************************************************************************
Solution
# Step-1
Install terraform
sudo snap install terraform
![image](https://github.com/ROHIT9417/terraform/assets/120156674/4226dbe2-05cd-497b-8115-3926531a5775)
Create on IAM user and attach permission to create these resources 
![image](https://github.com/ROHIT9417/terraform/assets/120156674/c3d30035-4c0e-4ee9-b266-6adca272a3ef)
#terraform plan
#terraform apply
   ![image](https://github.com/ROHIT9417/terraform/assets/120156674/5ef1710d-a5de-45b3-8f1a-967bb3e936e9)
![image](https://github.com/ROHIT9417/terraform/assets/120156674/079db7d9-3f59-47c3-ade8-7ece2d84348b)
![image](https://github.com/ROHIT9417/terraform/assets/120156674/33af3c13-e729-4146-b2b6-9de9b20bea8a)
Step-
Verify

![image](https://github.com/ROHIT9417/terraform/assets/120156674/0691fe79-4151-462d-af1c-e21a2c6c7fb3)
![image](https://github.com/ROHIT9417/terraform/assets/120156674/a30af206-0359-4a52-ba4c-2c80c595f035)
![image](https://github.com/ROHIT9417/terraform/assets/120156674/04b2b0b4-8753-49d4-b13d-359399a082ce)

Thank you 
  
