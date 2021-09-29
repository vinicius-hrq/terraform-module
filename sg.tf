data "aws_security_group" "default" {

    filter {
      name = "group-name"
      values = ["default-sg"]
    }
    
    tags = {
      "produto" = "default"
    }
}

resource "aws_security_group" "optional" {
  count = var.enable_sg ? 1 : 0
  name = "allow-traffig-${var.name}"

  dynamic "ingress" {
      iterator = port
      for_each = var.ingress_ports
      content {
          from_port = port.value
          to_port = port.value
          procotol = "tcp"
          cidr_blocks = ["0.0.0.0/0"]
      }
  }

  ingress = {
    to_port = 22
    from_port = 22
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  } 
  egress = {
    to_port = 0
    from_port = 0
    protocol = "-1"
    cidr_blocks = [ "0.0.0.0/0" ]    
  }
}