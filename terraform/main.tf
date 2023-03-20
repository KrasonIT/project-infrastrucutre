# Inicjowanie dostawcy AWS
provider "aws" {
  region = "us-west-2"
}

# Tworzenie grupy zasobów
resource "aws_resource_group" "example" {
  name = "example-resource-group"
}

# Tworzenie instancji EC2
resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  key_name      = "example_key"
  security_groups = [
    aws_security_group.example.id,
  ]
  tags = {
    Name = "example-instance"
  }
}

# Tworzenie grupy zabezpieczeń
resource "aws_security_group" "example" {
  name_prefix = "example-security-group-"

  ingress {
    from_port = 0
    to_port = 65535
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Tworzenie klucza SSH
resource "aws_key_pair" "example" {
  key_name   = "example_key"
  public_key = file("~/.ssh/id_rsa.pub")
}

