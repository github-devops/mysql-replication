#!/bin/bash

#Запросите список членов группы репликации
mysql -uroot -proot -e "SELECT * FROM performance_schema.replication_group_members;"

