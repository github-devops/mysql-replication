#!/bin/bash

docker-compose kill master slave-1 slave-2 &&\
sudo rm -rf data/
