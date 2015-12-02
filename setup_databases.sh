#!/bin/bash
read -p "Please input MySQL User(default is root):" user
if [ "${user}" = "" ];then
    user="root"
fi

read -p "Please input MySQL Host(default is localhost):" host
if [ "${host}" = "" ];then
    host="localhost"
fi

read -p "Please input MySQL ${user}'s password(default is ''):" passwd

echo "drop database if exists valentine" | mysql --host=${host} --user=${user} --password=${passwd}
echo "create database valentine" | mysql --host=${host} --user=${user} --password=${passwd}
if [ $? -ne 0 ]; then
    exit 1
fi
(echo "use valentine"; cat vilya/databases/schema.sql) | mysql --host=${host} --user=${user} --password=${passwd}
