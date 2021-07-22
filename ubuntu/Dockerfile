FROM ubuntu
RUN apt-get update
RUN apt-get install -y acl
RUN apt-get install -y wget
RUN apt-get install -y python3-pip
RUN pip3 install mysql-connector-python
RUN apt-get install cron

COPY genUser.sh genUser.sh
COPY permit.sh permit.sh
COPY schedule.sh schedule.sh
COPY attendance.sh attendance.sh
COPY genMoM.sh genMoM.sh
COPY genMoM1.sh genMoM1.sh
COPY aliases_and_crontabs.sh aliases_and_crontabs.sh
COPY db.py db.py
COPY createdb.py createdb.py

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
