#!/bin/bash
set -e

mongo <<EOF
use admin
db.auth('$MONGO_INITDB_ROOT_USERNAME', '$MONGO_INITDB_ROOT_PASSWORD')

use $MONGO_DB

db.createUser({
  user: '$MONGO_DB_USERNAME',
  pwd: '$MONGO_DB_PASSWORD',
  roles: [
    {
      role: 'readWrite',
      db: '$MONGO_DB'
    }
  ]
})

db.createCollection('users')
db.users.createIndex({ "email": 1 }, { unique: true })

db.createCollection('players')
db.players.insertMany([
  {
    name: "Lionel Messi",
    position: "Forward",
    team: "Inter Miami",
    age: 36
  },
  {
    name: "Cristiano Ronaldo",
    position: "Forward",
    team: "Al Nassr",
    age: 38
  }
])

EOF
