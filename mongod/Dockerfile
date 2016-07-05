FROM ubuntu:14.04

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927

ENV MONGO_MAJOR 3.2
RUN echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list


# Install MongoDB
RUN apt-get update
RUN sudo apt-get install -y mongodb-org

# Create the MongoDB data directory
RUN mkdir -p /data/db

EXPOSE 27017
ENTRYPOINT ["usr/bin/mongod"]
