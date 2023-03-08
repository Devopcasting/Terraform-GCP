
variable "project_id" {
  type    = string
  default = "xxx-xxx-xxx"
}

variable "location" {
  type    = string
  default = "us-central1"
}

variable "bucket_name" {
  type    = string
  default = "funix_unix_unix"
}

variable "function_name" {
  type    = string
  default = "my-function-gen1"
}

variable "function_description" {
  type    = string
  default = "This is GEN-1 Cloud Function"
}

variable "function_runtime" {
  type    = string
  default = "python310"
}


