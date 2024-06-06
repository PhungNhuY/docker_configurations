FROM mongo:7.0

# generate the keyfile 
RUN mkdir -p /opt/keyfile
RUN openssl rand -base64 756 > /opt/keyfile/mongo-keyfile
RUN chmod 400 /opt/keyfile/mongo-keyfile
RUN chown mongodb:mongodb /opt/keyfile/mongo-keyfile

# Copy the mongo-init.sh file to the container's initialization script directory
COPY mongo-init.sh /docker-entrypoint-initdb.d/mongo-init.sh

CMD [ "mongod", "--replSet", "rs0", "--port", "27017", "--dbpath", "/data/db", "--auth", "--keyFile", "/opt/keyfile/mongo-keyfile" ]