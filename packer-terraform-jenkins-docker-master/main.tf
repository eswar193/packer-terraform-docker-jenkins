provider "aws" {
    access_key = "AKIAYG2VVLDJN76VR3OK"
    secret_key = "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"
    region = "us-east-1"
}

data "aws_ami" "my_ami" {
     most_recent      = true
     #name_regex       = "^mavrick"
     owners           = ["564430985426"]
}


resource "aws_instance" "web-1" {
    ami = "${data.aws_ami.my_ami.id}"
    #ami = "ami-0d857ff0f5fc4e03b"
    availability_zone = "us-east-1a"
    instance_type = "t2.micro"
    key_name = "EBS"
    subnet_id = "subnet-00316ba9ce9c861a6"
	private_ip = "10.1.1.111"
    vpc_security_group_ids = ["sg-09c2fc6ae1a93c80e"]
    associate_public_ip_address = true	
    tags = {
        Name = "Server-1"
        Env = "Prod"
        Owner = "Sree"
    }
}
