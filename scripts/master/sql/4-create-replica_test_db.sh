#!/bin/bash

#Создайте тестовую БД и таблицу, чтобы проверить работу репликации:
mysql -uroot -proot -e "CREATE DATABASE replica_test_db;"
mysql -uroot -proot -e "CREATE TABLE replica_test_db.equipment ( id INT NOT NULL AUTO_INCREMENT, type VARCHAR(50), quant INT, color VARCHAR(25), PRIMARY KEY(id));"
mysql -uroot -proot -e "INSERT INTO replica_test_db.equipment (type, quant, color) VALUES (\"slide\", 2, \"blue\");"
mysql -uroot -proot -e "SELECT * FROM replica_test_db.equipment;"
