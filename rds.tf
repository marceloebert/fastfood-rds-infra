resource "aws_db_instance" "rds-fastfood" {
  allocated_storage    = 20              # Tamanho do armazenamento (GB)
  engine               = "mysql"         # Tipo do banco de dados
  engine_version       = "8.0"           # Versão do MySQL
  instance_class       = "db.t3.micro"   # Tipo da instância
  db_name              = "lanchonetedb"     # Nome do banco de dados
  username             = "sa"         # Usuário administrador
  password             = var.db_password # Senha segura
  parameter_group_name = "default.mysql8.0" # Grupo de parâmetros
  skip_final_snapshot  = true            # Evitar snapshot final ao destruir
  publicly_accessible  = true            # Se o banco deve ser público
  vpc_security_group_ids = [aws_security_group.rds_sg.id] # Segurança
  db_subnet_group_name = aws_db_subnet_group.fastfood.name # Associa o Subnet Group

  tags = {
    Name = "Fastfood-RDS"
  } 
}

 resource "aws_db_subnet_group" "fastfood" {
  name       = "db-subnet-group"
  subnet_ids = [for subnet in data.aws_subnet.subnet : subnet.id if subnet.availability_zone != "${var.regionDefault}e"]
  tags = {
    Name = "DB-Subnet-Group"
   }
  }
