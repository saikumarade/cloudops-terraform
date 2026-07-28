resource "aws_security_group" "alb_sg" {
    name = "${var.project_name}-${var.environment}-alb-sg"
    description = "secuirity groups for alb"
    vpc_id = var.vpc_id

    tags = {
        Name = "${var.project_name}-alb_sg"
        Environment = var.environment
        project = var.project_name
        ManagedBy = "Terraform"
    }
  
}

resource "aws_vpc_security_group_ingress_rule" "alb_http" {
    security_group_id = aws_security_group.alb_sg.id
    ip_protocol = "tcp"
    from_port = 80
    to_port = 80
    cidr_ipv4 = "0.0.0.0/0"
}

resource "aws_vpc_security_group_ingress_rule" "alb_https" {
    security_group_id = aws_security_group.alb_sg.id
    ip_protocol = "tcp"
    from_port = 443
    to_port = 443
    cidr_ipv4 = "0.0.0.0/0"
}

resource "aws_vpc_security_group_egress_rule" "alb_outbound" {
    security_group_id = aws_security_group.alb_sg.id
    ip_protocol = -1
    cidr_ipv4 = "0.0.0.0/0"
  
}
resource "aws_vpc_security_group_ingress_rule" "ecs_from_alb" {
    security_group_id            = aws_security_group.ecs_sg.id
    referenced_security_group_id = aws_security_group.alb_sg.id
    ip_protocol = "tcp"
    from_port   = 8080
    to_port     = 8080

}

resource "aws_security_group" "ecs_sg" {
    name = "${var.project_name}-ecs-sg"
    description = "secuirity groups for ecs"
    vpc_id = var.vpc_id

    tags = {
        Name = "${var.project_name}-ecs_sg"
        Environment = var.environment
        project = var.project_name
        ManagedBy = "Terraform"
    }
    
}

resource "aws_security_group" "rds_sg" {
    name = "${var.project_name}-rds-sg"
    description = "secuirity groups for rds"
    vpc_id = var.vpc_id

    tags = {
        Name = "${var.project_name}-rds_sg"
        Environment = var.environment
        project = var.project_name
        ManagedBy = "Terraform"
    }
}

resource "aws_vpc_security_group_ingress_rule" "rds_inbound" {
    security_group_id            = aws_security_group.rds_sg.id
    referenced_security_group_id = aws_security_group.ecs_sg.id
    from_port = 5432
    to_port = 5432
    ip_protocol = "tcp"
    
  
}

resource "aws_vpc_security_group_egress_rule" "rds_outbound" {
  security_group_id = aws_security_group.rds_sg.id

  ip_protocol = "-1"

  cidr_ipv4 = "0.0.0.0/0"
}




