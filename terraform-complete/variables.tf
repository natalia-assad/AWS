variable "aws_region" {
  type=string
  description=""
  default = "us-east-1"
}

variable "aws_profile" {
    type = string
    description=""
default = "user_terraform"
}

variable "tags" {
  type = map(string)
  description = ""
  default = {
    "chave" = "valor"
    "Project" = "Curso AWS com terraform"
    "CreatedAt" = "2024-12-16"
  }
}

variable "dynamodb_fields_list" {
  type = list(string)
  description = ""
  default = ["UserId","GameTitle"]
  
}

variable "database_config" {
  type = object({
    table_name = string
    read_capacity = optional(number,3)
    write_capacity = optional(number,3)
    deletion_protection = optional(bool,false)
  hash_key = object({
      name = string
      type = string
    })
  range_key = object({
      name = string
      type = string
    })
  }) 
  description = ""
  default = {
    table_name = "GameScores"
    hash_key = {
      name = "UserId"
      type = "S"
    }
    range_key = {
      name = "GameTitle"
      type = "S"
    }
  }
}