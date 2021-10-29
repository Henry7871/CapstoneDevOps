output "pub_sub_id" {
    value = aws_subnet.pub_sub.id
}

output "prv_sub_id" {
    value = aws_subnet.prv_sub.id
}

output "vpc_id" {
    value = aws_vpc.main.id
}

