#!/bin/sh

host="yourMySQLHostname"
username="username"
password="password"

for DB in $(mysql --host="$host" --user="$username" -p"$password" -e"show databases" --skip-column-names -s | grep -v information_schema);
do
  mysqldump --opt --host="$host" --user="$username" -p"$password" --no-tablespaces $DB | gzip > ./`date +%Y-%m-%d_%H.%M.%S`_$DB.sql.gz;
done
