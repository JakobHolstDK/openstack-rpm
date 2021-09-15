#!/usr/bin/env bash

#vl down


#Here we could setup virt-lightning.yaml
#Here redhat cleanup could and should cleanup orphans in the rhel subscriptions


#vl up

echo "#Auto generated inventory for virt-lightening" > inventory.remote

echo "" >> inventory.remote
echo "[api]" >> inventory.remote 
vl ansible_inventory | grep api >> inventory.remote

echo "" >> inventory.remote
echo "[db]" >> inventory.remote 
vl ansible_inventory | grep mariadb >> inventory.remote

echo "" >> inventory.remote
echo "[compute]" >> inventory.remote 
vl ansible_inventory | grep compute >> inventory.remote
echo "" >> inventory.remote
echo "" >> inventory.remote
echo "" >> inventory.remote
