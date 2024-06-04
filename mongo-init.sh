# init replication
# create admin user 
mongosh <<EOF
rs.initiate()
use admin
db.createUser({
  user: process.env.ROOT_USERNAME,
  pwd: process.env.ROOT_PASSWORD,
  roles: [ { role: "root", db: "admin" } ]
})
EOF