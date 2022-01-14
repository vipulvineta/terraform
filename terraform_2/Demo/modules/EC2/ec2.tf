#start ec2.tf
resource "aws_instance" "terraform_Demo" {
    ami                    = var.ami_id
    instance_type          = "t2.micro"
    # VPC
    subnet_id              = aws_subnet.Demo_Subnet.id
    # Security Group
    vpc_security_group_ids = [aws_security_group.Demo_Security_Group.id]
    key_name               = aws_key_pair.demo_key.key_name

    user_data = <<EOF
                #!/bin/bash
                sudo apt-get update
	            	mkdir /home/ubuntu/demo
                echo "creating new directory"

                EOF

    tags = {
        Environment = var.environment_tag
    }
    provisioner "local-exec" {
     command = "echo '${tls_private_key.demo.private_key_pem}' > ./myKey.pem"
    }
}



#end ec2
