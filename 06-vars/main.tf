# resource "aws_instance" "compute" {

#   ami           = "ami-0a700fe3132430839"
#   instance_type = var.ec2_config.type
#   root_block_device {
#     delete_on_termination = true
#     volume_size           = var.ec2_volume_size
#     volume_type           = "gp2"
#   }

# }

resource "aws_s3_bucket" "my_bucket" {
     bucket = "my-tf-test-bucketdkjgckgaj"
}


output "aws_s3_bucket" {
  value = aws_s3_bucket.my_bucket.bucket
  sensitive = true
}