module "sg_creation" {
    source = "../modules/sg"
    sg_author = var.author
    sg_env = var.env
}

module "ec2_creation" {
    source = "../modules/ec2"
    ec2_instance_type = var.instance_type
    ec2_ami = data.aws_ami.myami.id
    ec2_key_name = var.key_name
    ec2_author = var.author
    ec2_env = var.env
    ec2_vol_size = var.vol_size
    sg_id = module.sg_creation.sg_id
}