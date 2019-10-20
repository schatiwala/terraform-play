resource "aws_instance" "example" {
  ami = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"
  subnet_id = "subnet-2c92f64b"
  provisioner "local-exec" {
     command = "echo ${aws_instance.example.private_ip} >> private_ips.txt"
  }
  tags = {
    Name = "terraform-example"
    Region = "${var.AWS_REGION}"
  } 
}
output "ip" {
    value = "${aws_instance.example.public_ip}"
}
