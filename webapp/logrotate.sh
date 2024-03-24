#!/bin/sh

mv ./logs/nginx/access.log ./logs/nginx/access.log.`date +%Y%m%d-%H%M%S`
docker compose exec nginx nginx -s reload

sudo mv ./logs/mysql/mysql-slow.log ./logs/mysql/mysql-slow.log.`date +%Y%m%d-%H%M%S` 
docker compose restart mysql 
# docker compose exec mysql mysqladmin flush-logs