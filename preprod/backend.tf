terraform {
    backend "s3" {
        bucket = "projetgrp3-terraform-backend"
        key = "projetgrp3-backend-preprod.tfstate"
        region                  = "us-east-1"
        shared_credentials_file = "/Users/renaudsautour/Downloads/PROJET/terraform/credentials"
    }
}