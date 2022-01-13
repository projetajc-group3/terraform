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

  user_data = <<-EOF
              #!/bin/bash
              sudo apt update -y
              sudo apt install ansible git -y
              sleep 5
              git clone https://github.com/projetajc-group3/docker_role_deploy.git
              ansible-galaxy install -r docker_role_deploy/roles/requirements.yml
              ansible-playbook -i docker_role_deploy/hosts.yml docker_role_deploy/docker.yml
              sudo rm -rf docker_role_deploy
              git clone https://github.com/projetajc-group3/kubernetes_role_deploy.git
              ansible-galaxy install -r kubernetes_role_deploy/roles/requirements.yml
              ansible-playbook -i kubernetes_role_deploy/hosts.yml kubernetes_role_deploy/kubernetes.yml
              sudo rm -rf kubernetes_role_deploy       
              EOF
              
  vpc_security_group_ids = [var.sg_id]

}
