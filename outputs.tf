output "database_endpoint" {
  value = aws_db_instance.emp_database.address
}

output "ami_id" {
  value = data.aws_ami_ids.ubuntu_2204.ids[0]
}

output "webserver_public_ip" {
  value = aws_instance.web.public_ip
}