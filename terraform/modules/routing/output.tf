
output "recipes_subnet_id" {
  description = "The subnet ID for EC2 inctances"
  value       = aws_subnet.recipes_subnet.id
}

output "recipes_host_sec_group" {
  description = "The security group ID for recipe host inctances"
  value       = aws_security_group.recipes_host_sec_group.id
}

output "recipes_sql_sec_group" {
  description = "The security group ID for recipe mysql inctances"
  value       = aws_security_group.recipes_sql_sec_group.id
}
