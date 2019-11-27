#!/bin/bash

#Запуск остальных нод
mysql -uroot -proot -e  "START GROUP_REPLICATION;"

#Запросите список членов группы репликации
mysql -uroot -proot -e  "SELECT * FROM performance_schema.replication_group_members;"

mysql -uroot -proot -e "SELECT * FROM replica_test_db.equipment;"

mysql -uroot -proot -e "SHOW SLAVE STATUS;"
