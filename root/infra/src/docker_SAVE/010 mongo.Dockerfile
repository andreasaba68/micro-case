FROM alpine:3.9.5

#!!beware of a known issue with mongo doesn't install "naturally" on alpine>3.9

MAINTAINER andrea.saba@gmail.com

RUN apk update
RUN apk upgrade
RUN apk add mongodb

# Create the MongoDB data directory
RUN mkdir -p /data/db

# Expose port #27017 from the container to the host and external world
EXPOSE 37017

ADD 010_create_admin.js /tmp/
RUN mongod --port 37017 --fork --logpath /var/log/mongodb.log && sleep 5 && mongo --port 37017 /tmp/010_create_admin.js

ADD 020_create_users.js /tmp/
RUN mongod -auth --port 37017 --fork --logpath /var/log/mongodb.log && sleep 5 && mongo --port 37017 -u admin -p admin /tmp/020_create_users.js

#Start MongoDb
CMD ["mongod", "-auth", "--port", "37017", "--bind_ip", "0.0.0.0"]
# CMD ["ash"]
