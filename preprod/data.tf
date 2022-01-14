data "aws_ami" "myami" {
  most_recent = true
  owners      = ["099720109477"]
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal*"]
  }
}

data "local_file" "mydata" {
  filename = "user_data.txt"
}
