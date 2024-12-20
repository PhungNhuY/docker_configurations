#!/bin/bash
echo "----------------------------------------"
echo "------Initializing the replica set------"
echo "----------------------------------------"
mongosh -u $MONGO_INITDB_ROOT_USERNAME -p $MONGO_INITDB_ROOT_PASSWORD <<EOF
rs.initiate({
  "_id": "rs0",
  "members": [
    {
      "_id": 0,
      "host": "localhost:27017"
    }
  ]
});
rs.status();
EOF