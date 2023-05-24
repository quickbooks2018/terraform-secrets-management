variable "username" {
  description = "Username for the master user"
  type        = string
  sensitive   = true
  # Sensitive is not propagated to the output
}

variable "password" {
  description = "Password for the master user"
  type        = string
  sensitive   = true
  # Sensitive is not propagated to the output
}