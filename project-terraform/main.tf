terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region = "ca-central-1"
}

provider "random" {}

resource "random_pet" "name" {}

resource "aws_instance" "app_server_windows" {
  ami           = "ami-windows_code"
  instance_type = "t2.micro"
  user_data     = file("init-script.sh")

  tags = {
    Name = random_pet.name.id
  }

resource "aws_instance" "app_server_ubuntu_18.04" {
  ami           = "ami-18.04_code"
  instance_type = "t2.micro"
  user_data     = file("init-script.sh")

  tags = {
    Name = random_pet.name.id
  }

resource "aws_instance" "app_server_ubuntu_20.04" {
  ami           = "ami-0b21b141ea690ace5"
  instance_type = "t2.micro"
  user_data     = file("init-script.sh")

  tags = {
    Name = random_pet.name.id
  }

resource "aws_instance" "app_server_rocky" {
  ami           = "ami-rockey_code"
  instance_type = "t2.micro"
  user_data     = file("init-script.sh")

  tags = {
    Name = random_pet.name.id
  }
}

