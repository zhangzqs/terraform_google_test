# main.tf

# 配置 random provider
terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "~> 3.0"
    }
  }
}

# 定义输入变量
variable "name" {
  description = "Your name to be included in the greeting"
  type        = string
  default     = "World"
}

variable "length" {
  description = "Length of the random string to generate"
  type        = number
  default     = 10
}

# 使用 random provider 生成随机字符串
resource "random_string" "example" {
  length  = var.length
  special = false
}

# 定义输出变量
output "greeting" {
  description = "A friendly greeting"
  value       = "Hello, ${var.name}!"
}

output "random_string" {
  description = "The generated random string"
  value       = random_string.example.result
  sensitive   = false
}