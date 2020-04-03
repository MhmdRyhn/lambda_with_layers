# Lambda With Layers
Creating and deploying AWS Lambda function (in Python) along with lambda Layers using Terraform.


# Environment Setup
**NOTE:** This project assumes that **Terraform v >= 0.12.23**, **Git**, **Python 3.8** and **virtualenv** package is 
installed in your system. <br>
- Clone  and then enter into the repository
```shell script
git clone https://github.com/MhmdRyhn/lambda_with_layers.git
cd lambda_with_layers
``` 
- Create and activate virtualenv
```shell script
virtualenv -p python3.8 venv
source venv/bin/activate
```
- Install dependencies
```shell script
pip3 install -r requirements.txt
```


# Terraform Setup
Make sure all the info (credentials and other values) in **input.tfvars** matches with the real (or local) 
infrustructure.  
- First enter into the terraform directory
```shell script
cd terraform
```
- Initialize terraform. It is needed only for the first time. This command is always safe to run multiple times, 
to keep the working directory up to date with changes in the configuration. See more details 
[**here**](https://www.terraform.io/docs/commands/init.html)
```shell script
terraform init
```
- See the plan 
```shell script
terraform plan --var-file input.tfvars
```
- Execute the plan
```shell script
terraform apply --var-file input.tfvars --auto-approve
```
- Now check in AWS console whether or not everything is OK.


# Testing The Function
Inside the lambda function in AWS console, there is a Test button at top-right corner. Beside this button, 
from drop-down, create an event to test the function. Sample event:
```json
{
    "body": {
        "name": "Talha",
        "age": 29
    }
}
```
