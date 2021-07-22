#! /bin/bash

docker cp 000-default.conf apache_container:/etc/apache2/sites-available/000-default.conf
echo "127.0.0.1     moms.local" >> apache_container:/etc/hosts
docker kill --signal-"USR1" apache_container
