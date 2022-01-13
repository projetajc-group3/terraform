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

  provisioner "remote-exec" {
    inline = [
      "sudo apt update -y",
      "sudo apt install ansible -y",
      "git clone https://github.com/projetajc-group3/docker_role_deploy.git",
      "cd cd docker_role_deploy/",
      "ansible-galaxy install -r roles/requirements.yml",
      "ansible-playbook -i hosts.yml docker.yml"
    ]
    
    connection {
      type        = "ssh"
      user        = "ubuntuuuuuu"
      private_key = file("/var/lib/jenkins/workspace/${var.ec2_key_name}.pem")
      host        = self.public_ip
    }
  }

  vpc_security_group_ids = [var.sg_id]

}
