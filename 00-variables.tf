
variable "external_network_id" {
  type    = string
  default = "fd401e50-9484-4883-9672-a2814089528c"
}
variable "availability_zone" {
  type    = string
  default = "Education"
}
variable "wordpress_image_id" {
  type    = string
  default = "377f4508-7aaa-4245-8253-5d518606c3bc"
}
variable "db_image_id" {
  type    = string
  default = "ab3620e2-f8e9-4747-95d0-aaf76e392d9d"
}

variable "base_image_id" {
  type    = string
  default = "c1feccfc-e739-4899-82af-ecb42f9609ad"
}


variable "flavor_id" {
  type    = string
  default = "c1-r1-d10"
}
variable "router_name" {
  type    = string
  default = "project_router"
}

variable "network_name" {
  type    = string
  default = "project_network"
}
variable "subnet_name" {
  type    = string
  default = "project_subnet"
}
variable "wordpress_instances" {
  type        = number
  description = "The Number of instances to be created."
  default     = 3
}

variable "floating_ip_pool" {
  type    = string
  default = "public"
}
