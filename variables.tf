// ---------------- //
// VARIABLES CONFIG //
// ---------------- //

// ----- AWS ----- //

variable "AWS_REGION" {
  description = "AWS region"
  default     = "us-west-2"
}

variable "AWS_TYPE" {
  description = "Type of EC2 instance to provision"
  default     = "t2.micro"
}

variable "INSTANCE_NAME" {
  description = "EC2 instance name"
  default     = "Provisioned by Terraform"
}

// ----- TFC ----- //

variable "TFC_TOKEN" { // Terraform Cloud API token
  description = "Terraform Cloud API token"
}

variable "TFC_ORG" { //Terraform Cloud organization
  description = "Terraform Cloud organization"
  default     = "ZeroTier"
}

variable "TFC_WORKSPACE" { //Terraform Cloud workspace
  description = "Terraform Cloud workspace"
  default     = "ZeroTier"
}

// ----- SYSTEM ----- //

variable "SSH_KEY" {
  description = "SSH key to use for EC2 instance"
  default     = "~/.ssh/id_rsa.pub"
}

variable "SSH_PORT" {
  description = "SSH port number"
  default     = 22
}
