resource "aws_instance" "ansible_server" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"

  vpc_security_group_ids = [aws_security_group.ansible_server.id]
  key_name               = "asdfghj"
  #   vpc_id      = aws_vpc.lab-vpc.id
  subnet_id  = aws_subnet.public.id
  depends_on = [aws_subnet.public]
  user_data = <<EOF
#!/bin/bash
sudo apt update
sudo apt install software-properties-common
sudo apt-add-repository ppa:ansible/ansible

sudo apt install --include-deps ansible
sudo apt install ansible-core -y


sudo apt  install docker.io

service docker start


EOF

  tags = {
    Name = "ansiblepull"
  }
}

resource "aws_eip" "ansible_server_ip" {
  instance = aws_instance.ansible_server.id
  vpc      = true
}


#sudo apt install docker.io