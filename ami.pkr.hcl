packer {
  required_plugins {
    amazon = {
      version = ">= 0.0.2"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

source "amazon-ebs" "Elasticsearch" {
  ami_name          = "Elasticsearch"
  instance_type     = "t2.small"
  region            = "ap-southeast-2"
  vpc_id            = "vpc-045d4523ab75c68df"
  subnet_id         = "subnet-016dbbab6e388a020"
  security_group_id = "sg-0da5fa37247cc0cf0"

  source_ami_filter {
    filters = {
      name = "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"

      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["099720109477"]
  }
  ssh_username = "ubuntu"
  tags = {
    "Name" = "ELK-Server"
  }
  deprecate_at = timeadd(timestamp(), "8766h")
}

build {
  name = "elasticsearch-packer"

  sources = [
    "source.amazon-ebs.Elasticsearch"
  ]
  provisioner "ansible" {
    playbook_file = "./playbook.yml"
  }
}
