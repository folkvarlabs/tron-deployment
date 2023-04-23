// ----------------------- //
// TERRAFORM CONFIGURATION //
// ----------------------- //

// Configure Provider

provider "aws" {
  region = var.AWS_REGION
}

resource "aws_instance" "dev_server" {
  ami           = "ami-xxxxxxxxxxxxxxxxx" // Replace with the latest Amazon Linux 2 AMI ID
  instance_type = var.AWS_TYPE

  key_name = aws_key_pair.my_key.key_name

  tags = {
    Name = var.INSTANCE_NAME
  }

  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo amazon-linux-extras install -y epel
              sudo yum install -y wget curl git unzip jq
              curl -fsSL https://code-server.dev/install.sh | sh
              systemctl --user enable --now code-server
              sudo systemctl enable --now code-server@$USER
              echo "export PASSWORD=my_password" | sudo tee -a /etc/profile.d/code-server.sh
              EOF
}

resource "aws_key_pair" "my_key" {
  key_name   = "my_key"
  public_key = file(var.SSH_KEY)
}

resource "aws_security_group" "allow_ssh_http" {
  name        = "allow_ssh_http"
  description = "Allow SSH and HTTP"

  ingress {
    from_port   = var.SSH_PORT
    to_port     = var.SSH_PORT
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


// Configure the TFC Provider

provider "tfe" {
  hostname = "app.terraform.io"
  token    = var.TFC_TOKEN
}

// ZeroTier Network

resource "tfe_organization" "org" {
  name = var.TFC_ORG
}

resource "tfe_workspace" "workspace" {
  name         = var.TFC_WORKSPACE
  organization = tfe_organization.org.name
}
