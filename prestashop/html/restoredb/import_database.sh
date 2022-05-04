#!/bin/bash
#mysql -h db -u root -pprestashop prestashop -e "DROP DATABASE prestashop; CREATE DATABASE prestashop"
#mysql -h db -u root -pprestashop prestashop <./prestashop.sql

mysql -h db -u root -pprestashop   <<EOF 
use prestashop;
UPDATE ps_configuration SET value = 'localhost' WHERE ps_configuration.id_configuration = 229;
UPDATE ps_configuration SET value = 'localhost' WHERE ps_configuration.id_configuration = 230;
UPDATE ps_shop_url SET domain = 'localhost', domain_ssl = 'localhost' WHERE ps_shop_url.id_shop_url = 1;
EOF
 