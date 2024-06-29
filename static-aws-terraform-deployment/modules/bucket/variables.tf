variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "index_document" {
  description = "The index document for the S3 website"
  type        = string
  default     = "index.html"
}

variable "error_document" {
  description = "The error document for the S3 website"
  type        = string
  default     = "error.html"
}

variable "website_content_dir" {
  description = "The directory containing the website content"
  type        = string
}
