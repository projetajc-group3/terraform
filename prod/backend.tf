terraform {
    backend "s3" {
        bucket = "projetgrp3-terraform-backend"
        key = "projetgrp3-backend-prod.tfstate"
        region                  = "us-east-1"
        shared_credentials_file = "/var/lib/jenkins/workspace/credentials"
    }
}
