module "test_instance_simple" {
    source  = "tf-openstack-modules/instances/openstack"
    version = "<version>"

    name = "instance"
    flavor_name = "m1.xs" 
    image_id = "<image_id>"
    key_pair_name = "my_key_pair"
    public_ip_network = "floating"

    ports = [
        {
            name = "db_port",
            network_id = "db_network_id",
            subnet_id = "db_subnet_id",
        },
        {
            name = "web_port",
            network_id = "web_network_id",
            subnet_id = "web_subnet_id",
        }
    ]
    server_groups = ["web"]
}