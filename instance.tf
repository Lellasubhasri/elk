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
#   provisioner "file" {
#     source = "kibana.yml"
#     destination = "/tmp/kibana.yml"
#     }
#     provisioner "file" {
#         source = "apache.conf"
#         destination = "/tmp/apache.conf"
      
#     }

    # provisioner "file" {
    #   source = "code.sh"
    #   destination = "/tmp/code.sh"
    # }
    # provisioner "file" {
    #     inline =[
    #         "chmod +x /tmp/code.sh",
    #         "sudo /tmp/code.sh"]
    #     }
      
    #   connection {
    #     host = coalesce(self.public_ip, self.Private_ip)
    #     type = "ssh"
    #     #user = var.Instance_username
    #     #private_key = file(var.path_to_private_key)
    #   }
    }
    
#     resource "aws_eip" "ansible_server_ip" {
#     instance = aws_instance.ansible_server.id
#     vpc      = true
# }




  