# resource "aws_instance" "Kibana_server" {
# ami = var.elasticsearch_ami_id
#   instance_type = "t3.medium"

#   vpc_security_group_ids = [aws_security_group.elk_server.id]
#   key_name = "KeyPAir"
#   subnet_id = aws_subnet.public.id
  
#   tags = {
#     Name = "elkserver"
#   }
# }