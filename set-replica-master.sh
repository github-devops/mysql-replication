#!/bin/bash

## Создайте пользователя с поддержкой SSL, передайте ему права на сервер, а затем сбросьте привилегии
mysql -uroot -proot -e "SET SQL_LOG_BIN=0;"
mysql -uroot -proot -e "CREATE USER 'repl'@'%' IDENTIFIED BY 'u8NqEfKU3MZV' REQUIRE SSL;"
mysql -uroot -proot -e "GRANT REPLICATION SLAVE ON *.* TO 'repl'@'%';"
mysql -uroot -proot -e "FLUSH PRIVILEGES;"
mysql -uroot -proot -e "SET SQL_LOG_BIN=1;"

# Затем настройте group_replication_recovery, чтобы использовать новую учётную запись.
# Это позволить всем серверам группы пройти аутентификацию.
mysql -uroot -proot -e "CHANGE MASTER TO MASTER_USER='repl', MASTER_PASSWORD='u8NqEfKU3MZV' FOR CHANNEL 'group_replication_recovery';"
mysql -uroot -proot -e "INSTALL PLUGIN group_replication SONAME 'group_replication.so';"

#Запуск группы репликации
mysql -uroot -proot -e "SET GLOBAL group_replication_bootstrap_group=ON;"
mysql -uroot -proot -e "START GROUP_REPLICATION;"
mysql -uroot -proot -e "SET GLOBAL group_replication_bootstrap_group=OFF;"

#Запросите список членов группы репликации
mysql -uroot -proot -e "SELECT * FROM performance_schema.replication_group_members;"

#Создайте тестовую БД и таблицу, чтобы проверить работу репликации:
mysql -uroot -proot -e "CREATE DATABASE playground;"
mysql -uroot -proot -e "CREATE TABLE playground.equipment ( id INT NOT NULL AUTO_INCREMENT, type VARCHAR(50), quant INT, color VARCHAR(25), PRIMARY KEY(id));"
mysql -uroot -proot -e "INSERT INTO playground.equipment (type, quant, color) VALUES (\"slide\", 2, \"blue\");"


mysql -uroot -proot -e "SELECT * FROM playground.equipment;"

