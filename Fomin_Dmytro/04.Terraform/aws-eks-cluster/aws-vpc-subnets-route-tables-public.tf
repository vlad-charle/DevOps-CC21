# A route table contains a set of rules, called routes, that are used to determine where network 
# traffic from your subnet or gateway is directed.
# Your VPC has an implicit router, and you use route tables to control where network traffic is 
# directed. Each subnet in your VPC must be associated with a route table, which controls the 
# routing for the subnet (subnet route table). You can explicitly associate a subnet with a 
# particular route table. Otherwise, the subnet is implicitly associated with the main route 
# table. A subnet can only be associated with one route table at a time, but you can associate 
# multiple subnets with the same subnet route table.
# 
# https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Route_Tables.html

# Resource: aws_routing_table
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table

# A routing table for traffic from private subnets 
# to the Internet through Internet Gateway
resource "aws_route_table" "public" {
  # The VPC ID
  vpc_id = aws_vpc.main.id

  route {
    # The CIDR block of the route. Destination IP of traffic
    cidr_block = "0.0.0.0/0"

    # Identifier of a VPC internet gateway or a virtual private gateway
    gateway_id = aws_internet_gateway.main.id
  }

  # A map of tags to assign to the resource.
  tags = {
    Name = "public"
  }
}
