terraform {
    backend "s3" {
        bucket = "kapil-remote-state-bucket"
        region = "us-east-1"
        key = "terraform"
        dynamodb_table = "terraform-lock"
        encrypt = true    
    }
}