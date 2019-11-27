#!/bin/bash -e


if ! docker-compose -v > /dev/null;then
	echo docker-compose not installed
	exit 1
fi	

mkdir -p data/{master,slave-1,slave-2}

docker-compose up --build -d

while true;do 
	! sudo docker-compose exec master ./start-group_replication_recovery.sh && ( echo "still running...";sleep 20 ) || break
done	

sudo docker-compose exec slave-1 ./start-slave-replication.sh
sudo docker-compose exec slave-2 ./start-slave-replication.sh
