variable "aws_region" {
  type = string
}

variable "ec2_instance_type" {
  type        = string
  default     = "t2.micro"
  description = "This is the instance type"

  validation {
    condition     = var.ec2_instance_type == "t2.micro" || var.ec2_instance_type == "t3.micro"
    error_message = "only supports t2.micro or t3.micro"
  }
}

variable "ec2_volume_size" {
  type    = number
  default = 8
}

variable "ec2_volume_type" {
  type    = string
  default = "gp2"
}

variable "ec2_config" {
    type = object({
      type = string
      size = number
    })
}