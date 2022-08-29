#!/bin/bash
# Read Password
echo -n Password:
read -s password
echo
[[ -z "$password" ]] && { echo "Password is empty" ; exit 1; }
# Run Command
host="hostname"
username="username"

for DB in $(mysql --host="$host" --user="$username" -p"$password" -e"show databases" --skip-column-names -s | grep -v information_schema);
do
  echo Backing up $DB;
  mysqldump --opt --host="$host" --user="$username" -p"$password" --no-tablespaces $DB | gzip > ./`date +%Y-%m-%d_%H.%M.%S`_$DB.sql.gz;
done