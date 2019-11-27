#!/bin/bash

## Создайте пользователя с поддержкой SSL, передайте ему права на сервер, а затем сбросьте привилегии
mysql -uroot -proot -e "SET SQL_LOG_BIN=0;"
mysql -uroot -proot -e "CREATE USER 'repl'@'%' IDENTIFIED BY 'u8NqEfKU3MZV' REQUIRE SSL;"
mysql -uroot -proot -e "GRANT REPLICATION SLAVE ON *.* TO 'repl'@'%';"
mysql -uroot -proot -e "FLUSH PRIVILEGES;"
mysql -uroot -proot -e "SET SQL_LOG_BIN=1;"
