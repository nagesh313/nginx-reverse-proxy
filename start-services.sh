#!/bin/bash
echo "Starting nginx"
exec nginx &
echo "Starting Spring boot Admin and Services"
exec nohup java -Dserver.port=8010 -jar /admin.jar & 
# exec nohup java -Dserver.port=8001 -jar /service.jar &
# exec nohup java -Dserver.port=8002 -jar /service.jar &
# exec nohup java -Dserver.port=8003 -jar /service.jar &
# exec nohup java -Dserver.port=8004 -jar /service.jar &
echo "Starting Last Service"
exec nohup java -Dserver.port=8000 -jar /service.jar

