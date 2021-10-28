
variable "external_network_id" {
  type    = string
  default = "fd401e50-9484-4883-9672-a2814089528c"
}
variable "availability_zone" {
  type    = string
  default = "Education"
}
variable "key_pair" {
  type    = string
  default = "mykey"
}
variable "image_id" {
  type    = string
  default = "5e516bba-bd16-42b1-8010-ab11375447fe"

}

variable "wordpress_image_id" {
  type    = string
  default = "c3d48704-1740-47f1-91d0-7a0f58961094"
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
