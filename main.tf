# Create a VPC
resource "aws_vpc" "vpc_task" {
  cidr_block = var.vpc_cidr_block

   tags = {
    Name = "vpc-task"
  }
}

resource "aws_subnet" "sunbet1" {
    vpc_id = aws_vpc.vpc_task.id
    cidr_block = var.subnets["subnet1"]["cidr_block"]
    availability_zone = var.subnets["subnet1"]["az"]
 
 tags = {
    Name = "subnet 1"
  }
}

resource "aws_subnet" "sunbet2" {
    vpc_id = aws_vpc.vpc_task.id
    cidr_block = var.subnets.subnet2.cidr_block
    availability_zone = var.subnets.subnet2.az

     tags = {
    Name = "subnet 2"
  }
}

resource "aws_internet_gateway" "igw_task" {
  vpc_id = aws_vpc.vpc_task.id

  tags = {
    Name = "main"
  }
}

resource "aws_route_table" "table_task" {
  vpc_id = aws_vpc.vpc_task.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw_task.id
  }

  tags = {
    Name = "example"
  }
}

# variable "subnets" {
#   type = list
#   default = ["10.0.0.0/24","10.0.1.0/24"]
# }

# variable "subnets" {
#   type = map
#   default = {
#    subnet1 =  {
#     cidr_block = "10.0.0.0/24"
#     az = "us-east-1a"
#    } 
#    subnet2 = {
#     cidr_block = "10.0.1.0/24"
#     az = "us-east-1b"
#    }
    
#   }    
# }

# resource "local_file" "foo" {
#   content  = "Hello World!"
#   filename = "${path.module}/file.txt"
# }



# String 
# number 
# boolean => true, false
# list  => ["banana","orange","mango","orange"]  , x[0], x[1]
# set   => ["banana","orange","mango"]
# map  x => { 
#     name = "ahmed"     
#     age = 15
#     }

#     x["name"] 
#     x["age"]


#    object =>  {
#         x = 
#         y = 
#     }
