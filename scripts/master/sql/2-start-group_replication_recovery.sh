#!/bin/bash

#Запуск группы репликации
mysql -uroot -proot -e "SET GLOBAL group_replication_bootstrap_group=ON;"
mysql -uroot -proot -e "START GROUP_REPLICATION;"
mysql -uroot -proot -e "SET GLOBAL group_replication_bootstrap_group=OFF;"
