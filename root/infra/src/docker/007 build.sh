
#sudo mount -t vboxsf dev /home/docker/hosts_dev
#chdir ~/hosts_dev/ws2/cloud-ready-udemy/infra/adapted\ by\ andrea/
#. 007\ build.sh

#build the image
docker image build . --tag mongo:0.1 --file './010 mongo.Dockerfile'

#docker images #should also find the "mongo" one with tag "0.1" at this point

#starts the container
docker run --name mongo -p 37017:37017 -d\
 -e MONGO_INITDB_ROOT_USERNAME=admin\
 -e MONGO_INITDB_ROOT_PASSWORD=admin\
 mongo:0.1 --config /etc/mongo/mongod.conf
# docker ps #should find also the mongo container at this point

#docker exec -ti mongo mongo --port 37017 -u "testUser" -p "testUser" dev
#mongo is mongod's client/shell which you can avail to have shell interactions, see mongo's documentation, leave with just exit

#To connect from windows:
#  download the mong installer and open it with 7zip, extract mongo.exe in a dir of your choice
#  open a command prompt and cd within it (e.g. cd /D W:\dev\bin)
#  finally: mongo --host andrea-VirtualBox --port 37017 --authenticationDatabase "dev" -u "tetUser" -p "testUser" dev
#  shorter: W:\dev\bin\mongo -u "testUser" -p "testUser" andrea-VirtualBox:37017/dev
#  shorter: W:\dev\bin\mongo -u "testUser" -p "testUser" andrea-VirtualBox:37017/devint

