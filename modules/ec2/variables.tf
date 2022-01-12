#Name of the creator
variable "ec2_author" {
    type = string
    default = "projetgrp3"
} 

#Environment of the instance
variable "ec2_env" {
    type = string
    default = "dev"
} 

#Ami for the instance
variable "ec2_ami" {
    type = string
    default = "ami-04505e74c0741db8d"
}

#Type of the instance
variable "ec2_instance_type" {
    type = string
    default = "t2.micro"
}

#Name of the ssh key
variable "ec2_key_name" {
    type = string
    default = "key-projetgrp3"
}

#Size of the root volume
variable "ec2_vol_size" {
    type = number
    default = 8
}

#Id of the security group to associate
variable "sg_id" {
    type = string
    default = ""
}