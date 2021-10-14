2dv517-group-3


### TO run 

1. Download your RC file from cscloud
2. Connect to LNU vpn
3. Clone this repo
4. Run terraform init in this directory
5. Run source <path/to/rc/file>
6. Add your private ssh key file into ssh agent ssh-add <path/to/your/pem/file>
7. Run terraform plan
8. Run terraform apply -parallelism 1 (you can try increase it more than 1 but beware that running to many parallels could cause problems I ran 3 last time and it worked)


Install ansible comunity.general package "ansible-galaxy collection install community.general"
# Usefully commands
| Title                                 | Command                                     |
|---------------------------------------|---------------------------------------------|
| ssh into a client with no floating ip | ssh -J ubuntu@floating-ip ubuntu@private-ip |
|                                       |                                             |
|                                       |                                             |