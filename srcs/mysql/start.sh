#!/bin/bash

#/usr/bin/mysqld --user=root --init_file=/init_file & sleep 3
#mysql thjonelldb -u root < thjonelldb.sql
#telegraf -config /etc/telegraf/telegraf.conf
#tail -f /dev/null

rc default
/etc/init.d/mariadb setup
rc-service mariadb start
mysql -e "CREATE DATABASE thjonelldb;"
mysql -e "GRANT ALL PRIVILEGES ON thjonelldb.* TO 'thjonell'@'%' IDENTIFIED BY 'thjonell' WITH GRANT OPTION;"
mysql -e "FLUSH PRIVILEGES;"
mysql -uroot thjonelldb < thjonelldb.sql
rc-service mariadb stop
exec mysqld_safe
