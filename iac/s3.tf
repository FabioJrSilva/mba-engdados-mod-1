###################################################################
# Cria Bucket S3 e atribui as configurações de ACL e Criptografia #
###################################################################

# Configura o nome e tags do Bucket.
resource "aws_s3_bucket" "datalake" {
  bucket = "${var.base_bucket_name}-${var.ambiente}-${var.numero_conta}-tf"

  tags = {
    "modulo" = "1"
  }
}

# Configura o ACL.
resource "aws_s3_bucket_acl" "bucket_acl" {
  bucket = aws_s3_bucket.datalake.bucket
  acl    = "private"
}

# Configura criptografia padrão.
resource "aws_s3_bucket_server_side_encryption_configuration" "bucket_encrypt" {
  bucket = aws_s3_bucket.datalake.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}



