resource "aws_instance" "compute" {

  ami           = "ami-0a700fe3132430839"
  instance_type = var.ec2_config.type
  root_block_device {
    delete_on_termination = true
    volume_size           = var.ec2_volume_size
    volume_type           = "gp2"
  }

}

