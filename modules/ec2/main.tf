resource "aws_instance" "myec2" {
  ami           = "${var.ec2_ami}"
  instance_type = "${var.ec2_instance_type}"
  key_name      = "${var.ec2_key_name}"
  tags = {
    Name      = "${var.ec2_author}-ec2-${var.ec2_env}"
    formation = "Frazer"
    iac       = "terraform"
  }

  root_block_device {
    delete_on_termination = true
    volume_size = var.ec2_vol_size
  }

  vpc_security_group_ids = [var.sg_id]
}