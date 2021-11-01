
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
  default = "c3d48704-1740-47f1-91d0-7a0f58961094"
}
variable "base_image_id" {
  type    = string
  default = "82753264-5244-4903-98a7-db0377915d32"
}

variable "db_image_id" {
  type    = string
  default = "665ee4e3-fcb9-47f4-8524-78165f07da65"
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
