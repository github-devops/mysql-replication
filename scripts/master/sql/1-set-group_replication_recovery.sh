#!/bin/bash

# Затем настройте group_replication_recovery, чтобы использовать новую учётную запись.
# Это позволить всем серверам группы пройти аутентификацию.
mysql -uroot -proot -e "CHANGE MASTER TO MASTER_USER='repl', MASTER_PASSWORD='u8NqEfKU3MZV' FOR CHANNEL 'group_replication_recovery';"
#mysql -uroot -proot -e "INSTALL PLUGIN group_replication SONAME 'group_replication.so';"