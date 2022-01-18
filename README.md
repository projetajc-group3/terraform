# Repository Terraform

<br>

Ce repository contient l'ensemble des manifests nécessaire à la création 
de deux instance ec2 et de deux Backend S3 dans AWS :

* Pré-Production :
  - t2.medium
  - SSD 15 Go
  - Sécurity Group : 22 / 30001
  - Key pair: key-projetgrp3.pem
 
* Production :
  - t2.large
  - SSD 20 Go
  - Sécurity Group : 22 / 30000
  - Key pair: key-projetgrp3.pem

<br>

Arborescence:

```sh
.
├── README.md
├── modules
│   ├── ec2
│   │   ├── main.tf
│   │   ├── output.tf
│   │   └── variables.tf
│   ├── sg_preprod
│   │   ├── main.tf
│   │   ├── output.tf
│   │   └── variables.tf
│   └── sg_prod
│       ├── main.tf
│       ├── output.tf
│       └── variables.tf
├── preprod
│   ├── backend.tf
│   ├── data.tf
│   ├── main.tf
│   ├── provider.tf
│   ├── terraform.tfvars
│   └── variable.tf
└── prod
    ├── backend.tf
    ├── data.tf
    ├── main.tf
    ├── provider.tf
    ├── terraform.tfvars
    └── variable.tf
```
