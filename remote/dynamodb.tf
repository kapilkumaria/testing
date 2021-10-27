resource "aws_dynamodb_table" "dynamo-db-terrafrom-lock" {
    name = "terraform-lock"
    hash_key = "LockID"
    read_capacity = 20
    write_capacity = 20

    attribute {
        name = "LockID"
        type = "S"
    }

    tags = {
        Name = "Terrafrom Lock Table"
    }
}