provider "aws" {
    region = var.region
}

resource "aws_s3_bucket" "remotestate" {
 #      region = var.region
       bucket = var.bucket-name
       acl = var.acl
       force_destroy = true

       versioning {
           enabled = true
       }

       tags = {
           Name = var.bucket-tag-name
           Environment = var.bucket-tag-env
       }
}