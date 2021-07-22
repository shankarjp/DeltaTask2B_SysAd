#! /bin/bash

echo "alias genUser='../../genUser.sh'">>/home/Jay_Jay/.bashrc
echo "alias permit='../../permit.sh'">>/home/Jay_Jay/.bashrc
echo "alias schedule='../../schedule.sh'">>/home/Jay_Jay/.bashrc
echo "alias attendance='../../attendance.sh'">>/home/Jay_Jay/.bashrc
echo "alias genMoM='../../genMom.sh'">>/home/Jay_Jay/.bashrc
echo "alias genMom1='../../genMom1.sh'">>/home/Jay_Jay/.bashrc

crontab -l >mycron
echo "0 0 * * * schedule.sh" >>mycron
crontab mycron
rm mycron

