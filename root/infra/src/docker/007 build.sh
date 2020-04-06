
#sudo mount -t vboxsf dev /home/docker/hosts_dev
#chdir ~/hosts_dev/ws2/cloud-ready-udemy/infra/adapted\ by\ andrea/
#. 007\ build.sh

#build the image
docker image build . --tag mongo:0.1 --file './010 mongo.Dockerfile'

#docker images #should also find the "mongo" one with tag "0.1" at this point

#starts the container
docker run --name=mongo -d -p 37017:37017 mongo:0.1
# docker ps #should find also the mongo container at this point

#docker exec -ti mongo mongo --port 37017 -u "testUser" -p "testUser" dev
#mongo is mongod's client/shell which you can avail to have shell interactions, see mongo's documentation, leave with just exit

#To connect from windows:
#  download the mong installer and open it with 7zip, extract mongo.exe in a dir of your choice
#  open a command prompt and cd within it (e.g. cd /D W:\dev\bin)
#  finally: mongo --host andrea-VirtualBox --port 37017 --authenticationDatabase "dev" -u "testUser" -p "testUser" dev
#  shorter: W:\dev\bin\mongo -u "testUser" -p "testUser" andrea-VirtualBox:37017/dev

============
# some triaging I did
low> docker run --name=mongo -it -p 37017:37017 mongo:0.1
low> mongod --port 37017 --bind_ip 0.0.0.0 -auth

#Attenzione: sul container è necessario avviare la sessione di mongo
#con i parametri espliciti come indicati sotto
hig> docker exec -ti mongo ash
hig> mongo --port 37017 --host localhost -u admin -p admin --authenticationDatabase "admin" admin
hig> mongo --port 37017 -u "testUser" --authenticationDatabase "dev" -p "testUser" dev






