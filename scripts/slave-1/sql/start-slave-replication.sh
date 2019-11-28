#!/bin/bash

mysql -e "CHANGE MASTER TO MASTER_HOST='master', MASTER_USER='repl', MASTER_PASSWORD='u8NqEfKU3MZV' FOR CHANNEL 'group_replication_recovery';"

#Запуск остальных нод
mysql -e  "START GROUP_REPLICATION;"

#Запросите список членов группы репликации
mysql -e  "SELECT * FROM performance_schema.replication_group_members;"

mysql -e "SHOW SLAVE STATUS;"
