#!/bin/sh

export REDIS_PORT=6379
export DATABASE_URL=http://root:wombat@127.0.0.1:3306/threatsim_development
export AIRBRAKE_PORT=80

sudo mount -t vboxsf Dotfiles ~/.dotfiles -o uid=1000,gid=1000
sudo mount -t vboxsf Sites ~/wombat -o uid=1000,gid=1000
sudo mount -t vboxsf aws ~/.aws -o uid=1000,gid=1000

#docker run --name=mysql  -e MYSQL_ROOT_PASSWORD=wombat -p 3306:3306 -d mysql/mysql-server:5.6
#docker run --name=redis -p 127.0.0.1:6379:6379 -d redis:latest

docker start redis mysql
