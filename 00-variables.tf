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
    default = "baa8f7a5-2ebc-44c2-a44f-58dcf5da6558"
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

variable "baked_image"{
    type = string
    default = "baked_image"
}

variable "floating_ip_pool" {
  type = string
  default ="public"
}