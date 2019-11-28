#!/bin/bash

## Создайте пользователя с поддержкой SSL, передайте ему права на сервер, а затем сбросьте привилегии
mysql -e "SET SQL_LOG_BIN=0;"
mysql -e "CREATE USER 'repl'@'%' IDENTIFIED BY 'u8NqEfKU3MZV' REQUIRE SSL;"
mysql -e "GRANT REPLICATION SLAVE ON *.* TO 'repl'@'%';"
mysql -e "FLUSH PRIVILEGES;"
mysql -e "SET SQL_LOG_BIN=1;"


mysql -e "CREATE DATABASE test_repl;"

# Затем настройте group_replication_recovery, чтобы использовать новую учётную запись.
# Это позволить всем серверам группы пройти аутентификацию.
mysql -e "CHANGE MASTER TO MASTER_USER='repl', MASTER_PASSWORD='u8NqEfKU3MZV' FOR CHANNEL 'group_replication_recovery';"
#mysql -e "INSTALL PLUGIN group_replication SONAME 'group_replication.so';"#!/bin/bash

#Запуск группы репликации
mysql -e "SET GLOBAL group_replication_bootstrap_group=ON;"
mysql -e "START GROUP_REPLICATION;"
mysql -e "SET GLOBAL group_replication_bootstrap_group=OFF;"

#Запросите список членов группы репликации
mysql -e "SELECT * FROM performance_schema.replication_group_members;"

