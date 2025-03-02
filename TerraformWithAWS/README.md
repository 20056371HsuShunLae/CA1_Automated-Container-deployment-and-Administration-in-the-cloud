# Automatic Provision of AWS EC2 Instance By Using Terraform

This project explains how to use Terraform to automatically provision an AWS EC2 instance and its resources. It creates the EC2 instance, VPC, security group, and SSH key pair, as well as outputs the EC2 instance's public IP.


## File Structure
```
TerraformWithAWS
    │   .terraform.lock.hcl
    │   main.tf                     # Main Terraform configuration to deploy EC2 instance and integrate resources                             
    │   outputs.tf                  # Outputs EC2's public IP
    │   terraform.tfstate
    │   terraform.tfstate.backup
    │
    ├───.terraform                  # Directory containing Terraform provider plugins
    │   ├───modules
    │   │       modules.json
    │   │
    │   └───providers
    │       └───registry.terraform.io
    │           └───hashicorp
    │               └───aws
    │                   └───5.87.0
    │                       └───windows_amd64
    │                               LICENSE.txt
    │                               terraform-provider-aws_v5.87.0_x5.exe
    │
    ├───ec2_resources        # Module to deploy EC2 Resources
    │       main.tf            # EC2 instance definition
    │       outputs.tf         # Outputs related to EC2 instance
    │       variable.tf        # Variables for EC2 resources
    │
    ├───key_pair             # Module to deploy SSH Key Pair
    │       main.tf            # SSH key pair definition
    │       outputs.tf         # Outputs related to SSH key pair  
    │
    ├───security_group       # Module to deploy Security Group
    │       main.tf            # Security group configuration
    │       outputs.tf         # Outputs related to security group
    │       variable.tf        # Variables for Security Group
    │
    └───VPC                  # Module to deploy VPC
            main.tf            # VPC definition
            outputs.tf         # Outputs related to the VPC
            variable.tf        # Variables for VPC resources
```

## Workflow

This project uses Terraform to automate the provisioning of an AWS EC2 instance along with the related resources necessary for a functional deployment. 

### Pre Confiuration

Terraform must have the necessary AWS provider plugin set up to link with AWS.

![image](https://github.com/user-attachments/assets/1d5d5846-8f89-4196-91a3-348d24c63a4b)


The script will work by integrating four configrued Modules.

### Module

#### VPC Module

Creating the VPC network block, public subnet for the purpose EC2 instance, internet gatway and routing table for the public access.

File path: `./VPC/main.tf`

#### Security Group Module

Defining the input traffic and output traffic for EC2 instance.

File path: `./security_group/main.tf`

#### Key Pair Module

Defining SSH key pair to access the EC2 instance.

File path: `./key_pair/main.tf`

#### EC2 Module

Configures the EC2 Instance and associates it with the created VPC, security group, and SSH key pair.

File path: `./ec2_resources/main.tf`

## Requirements

Terraform (v1.10.5 or higher)

AWS Account: Make sure your AWS credentials are configured with adequate permissions to deploy the resources.

AWS CLI: Optional, but helpful for managing credentials.

## Usage

Initialize Terraform
```
terraform init
```

Plan the infrastructure
```
terraform plan
```

Apply the Terraform configuration
```
terraform apply -auto-approve
```

In case, if you want to destroy after creation
```
terraform destroy -auto-approve
```
## Outputs

After applying the Terraform configuration, the EC2 instance's Public IP will be printed.

![image](https://github.com/user-attachments/assets/2178cad4-31ee-43ab-966f-b9c9ebb53316)



## Author

Hsu Shun Lae

Github : https://github.com/20056371HsuShunLae



