resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name        = var.vpc_name
    Environment = var.environment
    ManagedBy    = "Terraform"
  }

}

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.main.id
    tags =   {
            Name = var.igw_name
            Environment = var.environment
            ManagedBy = "Terraform"
    }
}


resource "aws_subnet" "public_subnet_a" {
    vpc_id = aws_vpc.main.id
    cidr_block = var.public_subnet_a_cidr
    availability_zone = var.public_subnet_a_availability_zone
    map_public_ip_on_launch = true
    tags = {
        Name = var.public_subnet_a_name
        Environment = var.environment
        ManagedBy = "Terraform"
    }
    }

    resource "aws_subnet" "public_subnet_b" {
    vpc_id = aws_vpc.main.id
    cidr_block = var.public_subnet_b_cidr
    availability_zone = var.public_subnet_b_availability_zone
    map_public_ip_on_launch = true
    tags = {
        Name = var.public_subnet_b_name
        Environment = var.environment
        ManagedBy = "Terraform"
    }
    }

resource "aws_subnet" "private_subnet_a" {
    vpc_id = aws_vpc.main.id
    cidr_block = var.private_subnet_a_cidr
    availability_zone = var.private_subnet_a_availability_zone
    map_public_ip_on_launch = false
    tags = {
        Name = var.private_subnet_a_name
        Environment = var.environment
        ManagedBy = "Terraform"
    }
    }

    resource "aws_subnet" "private_subnet_b" {
    vpc_id = aws_vpc.main.id
    cidr_block = var.private_subnet_b_cidr
    availability_zone = var.private_subnet_b_availability_zone
    map_public_ip_on_launch = false
    tags = {
        Name = var.private_subnet_b_name
        Environment = var.environment
        ManagedBy = "Terraform"
    }
    }


 resource "aws_eip" "nat_a" {
    tags = {
        Name = var.eip_name
        Environment = var.environment
        ManagedBy = "Terraform"
    }
   
 }

 resource "aws_nat_gateway" "nat" {
    allocation_id = aws_eip.nat_a.id
    subnet_id = aws_subnet.public_subnet_a.id

    tags = {
        Name = var.nat_name
        Environment = var.environment
        ManagedBy = "Terraform"  
    }
}

resource "aws_route_table" "public" {
    vpc_id = aws_vpc.main.id

    route {
        cidr_block = var.public_route_cidr
        gateway_id = aws_internet_gateway.igw.id

    }
    tags = {
        Name = "public_route_table"
        Environment = var.environment
        ManagedBy = "Terraform"
    }

  
}

resource "aws_route_table_association" "public_a" {
        subnet_id = aws_subnet.public_subnet_a.id
        route_table_id = aws_route_table.public.id
}

resource "aws_route_table" "private" {
    vpc_id = aws_vpc.main.id

    route {
        cidr_block = var.private_route_cidr
        nat_gateway_id = aws_nat_gateway.nat.id

    }
    tags = {
        Name = "private_route_table"
        Environment = var.environment
        ManagedBy = "Terraform"
    }
}

resource "aws_route_table_association" "private_a" {
    subnet_id      = aws_subnet.private_subnet_a.id
    route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private_b" {
    subnet_id      = aws_subnet.private_subnet_b.id
    route_table_id = aws_route_table.private.id
}