resource "aws_instance" "elk" {
ami = var.elasticsearch_ami_id
instance_type = "t3.medium"
vpc_security_group_ids = [aws_security_group.elk_server.id]
  key_name = "KeyPAir"
  subnet_id = aws_subnet.public.id
  user_data = "${file("code.sh")}"
  
  tags = {
    Name = "elk"
  }
#  
}




  