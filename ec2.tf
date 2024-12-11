resource "aws_instance" "ansible-master" {
  ami           = "ami-09c813fb71547fc4f" 
  vpc_security_group_ids = ["sg-06b1b57b365846051"]

  instance_type = "t3.micro"

    connection {
    type     = "ssh"
    user     = "ec2-user"
    password = "DevOps321"
    host     = self.public_ip
  }
   provisioner "remote-exec" {
    inline = [
      "sudo dnf install ansible -y"
    ]
  }
   tags = {
    Name = "ansible-master" #Here 'Helloworld-db' is the ec2-instance name in AWS, not related to Terrafrom.
  }
}
# resource "aws_instance" "ansible-node1" {
#   ami           = "ami-09c813fb71547fc4f" 
#   vpc_security_group_ids = ["sg-06b1b57b365846051"]

#   instance_type = "t2.micro"

#   #   connection {
#   #   type     = "ssh"
#   #   user     = "ec2-user"
#   #   password = "DevOps321"
#   #   host     = self.public_ip
#   # }
  
#   #  provisioner "remote-exec" {
#   #   inline = [
#   #     "sudo dnf install ansible -y"
#   #   ]
#   # }
#    tags = {
#     Name = "ansible-node1" #Here 'Helloworld-db' is the ec2-instance name in AWS, not related to Terrafrom.
#   }
# }