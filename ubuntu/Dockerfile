FROM ubuntu:latest

ENV TZ=Asia/Kolkata
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update
RUN apt-get install -y acl
RUN apt-get install -y wget
RUN apt-get install -y python3-pip
RUN pip3 install mysql-connector-python
RUN apt-get install cron
RUN apt install -y apache2
RUN a2enmod proxy
RUN a2enmod proxy_http
RUN a2enmod proxy_balancer
RUN a2enmod lbmethod_byrequests

COPY genUser.sh genUser.sh
COPY permit.sh permit.sh
COPY schedule.sh schedule.sh
COPY attendance.sh attendance.sh
COPY genMoM.sh genMoM.sh
COPY genMoM1.sh genMoM1.sh
COPY aliases_and_crontabs.sh aliases_and_crontabs.sh
COPY db.py db.py
COPY createdb.py createdb.py
COPY script.sh script.sh
COPY sqlconn.py sqlconn.py

RUN chmod +x genUser.sh
RUN ./genUser.sh
RUN chmod +x permit.sh
RUN ./permit.sh
RUN chmod +x schedule.sh
RUN ./schedule.sh
RUN chmod +x attendance.sh
RUN ./attendance.sh
RUN chmod +x genMoM.sh
RUN ./genMoM.sh
RUN chmod +x genMoM1.sh
RUN ./genMoM1.sh
RUN chmod +x aliases_and_crontabs.sh
RUN ./aliases_and_crontabs.sh
RUN chmod +x script.sh
RUN ./script.sh

