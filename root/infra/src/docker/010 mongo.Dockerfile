FROM mongo:4.2.5-bionic

MAINTAINER andrea.saba@gmail.com

# Exposes port #27017 from the container to the host and external world
EXPOSE 37017

ADD 015_create_users.js /docker-entrypoint-initdb.d/999_create_users.js
ADD 017_mongod.conf /etc/mongo/mongod.conf
