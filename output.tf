output "vpc_id" {
    value = aws_vpc.My_vpc.id
  
}
output "aws_internet_gateway" {
    value = aws_internet_gateway.My_internet.id
  
}
output "aws_subnet" {
    value = aws_subnet.privte_subnet
  
}
