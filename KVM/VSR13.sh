#!/usr/bin/env bash

sudo cp ../../temp/default-nokia-sros-20.2.R1.qcow2 /var/lib/libvirt/images/VSR13.qcow2

sudo virt-install \
  --name=VSR13 \
  --description "VSR13 VM" \
  --os-type=Linux \
  --sysinfo type='smbios',system_product='TIMOS:address=169.254.255.113/24@active static-route=192.168.1.0/24@169.254.255.1 license-file=ftp://dcf_helper:aq1sw2de3fr4@169.254.255.1/sros20.lic slot=A chassis=SR-1 card=iom-1 mda/1=me6-100gb-qsfp28'\
  --ram=4096 \
  --vcpus=2 \
  --boot hd \
  --disk path=/var/lib/libvirt/images/VSR13.qcow2,bus=virtio,size=4 \
  --import \
  --graphics vnc \
  --serial tcp,host=0.0.0.0:2263,mode=bind,protocol=telnet \
  --network=bridge:br0,mac=52:54:00:13:00:00,model=virtio \
  --network=bridge:br111,mac=52:54:00:13:00:01,model=virtio \
  --network=bridge:br112,mac=52:54:00:13:00:02,model=virtio 
