# Terraform AWS EC2 Instance with Code-Server

This Terraform configuration provisions an AWS EC2 instance with Code-Server installed. The instance is created using the specified Amazon Linux 2 AMI, and the security group allows SSH and HTTP traffic.

## Files

- `main.tf`: The main Terraform configuration file. It contains the AWS provider, EC2 instance, key pair, security group, and Terraform Cloud (TFC) provider.

- `variables.tf`: The variables configuration file containing AWS, TFC, and system-related variables.

- `outputs.tf`: The outputs configuration file that provides information about the created resources. In this case, the instance AMI and ARN.

- `versions.tf`: The versions file specifying the required providers and Terraform version.

## Usage

1. Ensure you have Terraform installed (version 0.14.0 or later) and the appropriate AWS credentials set up.

2. Update the `variables.tf` file with your desired AWS region, EC2 instance type, and other necessary variables.

3. Replace the Amazon Linux 2 AMI ID in `main.tf` with the latest one for your desired region.

4. Initialize the Terraform working directory:

```bash
terraform init
```

5. Run `terraform plan` to see the resources that will be created:

```bash
terraform plan
```

6. Apply the Terraform configuration to create the resources:

```bash
terraform apply
```

7. After the resources have been created, you can view the instance AMI and ARN in the output:

```bash
terraform output instance_ami
terraform output instance_arn
```

8. When you're done with the resources, destroy them by running:

```bash
terraform destroy
```

## Notes

- The configuration uses the latest Amazon Linux 2 AMI, but you can replace it with your preferred AMI.

- The security group allows SSH and HTTP traffic from any IP address (0.0.0.0/0). You may want to restrict access to specific IP addresses or CIDR blocks for added security.

- The Terraform Cloud (TFC) provider is included but not actively used in this configuration. You can remove it or modify it as needed for your specific use case.