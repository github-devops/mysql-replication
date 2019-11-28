#!/bin/bash

#Запуск остальных нод
mysql -e  "START GROUP_REPLICATION;"

#Запросите список членов группы репликации
mysql -e  "SELECT * FROM performance_schema.replication_group_members;"

mysql -e "SHOW SLAVE STATUS;"
