resource "aws_instance" "public" {
  count     = length(var.availability_zones)
  subnet_id = element(aws_subnet.public.*.id, count.index)
  availability_zone = element(var.availability_zones, count.index)
  instance_type          = var.instance_type
  security_groups        = [aws_security_group.public.id]
  vpc_security_group_ids = [aws_security_group.public.id]
  ami                    = var.ami_id
  key_name               = aws_key_pair.anand.key_name
  user_data              = <<-EOF
              #!/bin/bash
              sudo apt update -y
              EOF

  provisioner "file" {
    source      = "/Users/eabuhna/.ssh/id_rsa"
    destination = "/home/ubuntu/.ssh/id_rsa"
  }

  provisioner "file" {
    source      = "/Users/eabuhna/.ssh/id_rsa.pub"
    destination = "/home/ubuntu/.ssh/id_rsa.pub"
  }

  connection {
    type = "ssh"
    user = "ubuntu" //ubuntu
    //user        = "ec2-user" //Opensuse
    private_key = file("/Users/eabuhna/.ssh/id_rsa")
    host        = self.public_ip
  }
}


resource "aws_instance" "private" {
  count     = length(var.availability_zones)
  subnet_id = element(aws_subnet.private.*.id, count.index)
  //subnet_id              = aws_subnet.private[0].id
  availability_zone = element(var.availability_zones, count.index)
  //availability_zone      = var.availability_zones[0]
  ami                    = var.ami_id
  instance_type          = var.instance_type
  security_groups        = [aws_security_group.private.id]
  vpc_security_group_ids = [aws_security_group.private.id]
  key_name               = "crio"
}



