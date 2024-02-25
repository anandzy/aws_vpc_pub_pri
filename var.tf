variable "availability_zones" {
  description = "List of availability zones in which to create subnets"
  type        = list(string)
  default     = ["us-east-1f", "us-east-1d"]
  //default = ["us-east-1a", "us-east-1b", "us-east-1c", "us-east-1d", "us-east-1e", "us-east-1f"]
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC."
  default     = "10.0.0.0/16"
}

variable "region" {
  description = "The AWS region in which resources will be created."
  default     = "us-east-1"

}

variable "ami_id" {
  description = "The AMI ID to use for the EC2 instances, from Ubuntu Server 22.04 LTS (HVM), SSD Volume Type"
  //default     = "ami-06aa3f7caf3a30282" //Ubuntu20.04
  default = "ami-0c7217cdde317cfec" //Ubuntu22.04
  //default     = "ami-05efd9e66ddc3cf4b" //OpenSUSE
}


variable "instance_type" {
  description = "The type of EC2 instance to launch"
  default     = "t3.medium"
}