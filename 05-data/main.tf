data "aws_caller_identity" "current" {}
data "aws_region" "current" {
    provider = aws.second
}

output "aws_caller_identity" {
  value = data.aws_caller_identity.current
}

output "aws_region" {
    value=data.aws_region.current
}

# we can also fetch resources based on tags 

data "aws_vpc" "my_vpc" {
    tags = {
        Name = "Default VPC"
    }
}

output "vpc_data" {
    value=data.aws_vpc.my_vpc.id
}


data "aws_availability_zones" "available" {
    state = "available"
}

output "azs" {
    value=data.aws_availability_zones.available
}