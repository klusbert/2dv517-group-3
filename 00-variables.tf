variable "image" {
    type = string
    default = "Ubuntu 20.04"
}
variable "external_network_id" {
  type = string
  default = "fd401e50-9484-4883-9672-a2814089528c"
}
variable "availability_zone" {
  type = string
  default = "Education"
}
variable "image_id"{
    type = string
    default = "ca4bec1a-ac25-434f-b14c-ad8078ccf39f"
}
variable "flavor_id"{
    type = string
    default = "c1-r1-d10"
}
variable "router_name" {
    type = string 
    default = "project_router"
}

variable "network_name" {
    type = string
    default = "project_network"
}
variable "subnet_name"{
    type = string
    default = "project_subnet"
}
variable "wordpress_instances" {
    type = number
    description = "The Number of instances to be created."
    default  = 3
}

variable "floating_ip_pool" {
  type = string
  default ="public"
}