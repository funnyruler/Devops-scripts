#!/bin/bash
sudo apt update
sudo apt install postgresql postgresql-contrib
sudo systemctl start postgresql.service

service_name="postgresql"
if systemctl is-active --quiet "$service_name.service" ; then
  echo "$service_name running"
  sh postgres_configure.sh
else
  systemctl start "$service_name"
fi