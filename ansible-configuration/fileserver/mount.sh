#!/bin/bash
## only format if not formated!!

apt install nfs-kernel-server

mkfs -t ext4 /dev/sdb -n

mkdir -p /mnt/nfs_share
mount /dev/sdb /mnt/nfs_share

chown -R nobody:nogroup /mnt/nfs_share/
chmod 777 /mnt/nfs_share/

echo "/mnt/nfs_share   *(rw,sync,no_root_squash,no_subtree_check)" >> /etc/exports

exportfs -a
systemctl restart nfs-kernel-server