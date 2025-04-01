#!/bin/bash
set -e

mongo <<EOF
use admin
db.auth('$MONGO_INITDB_ROOT_USERNAME', '$MONGO_INITDB_ROOT_PASSWORD')

use $MONGO_DB

db.users.insertOne({
  email: "admin@example.com",
  password: "\$2a\$10\$n9T6XjZWMkCDzGhxNLY4/.BgFBf5JbhAYM1m.1I1h6GGlpZnQm8Uy",  # hashed password: 'admin123'
  name: "Admin User",
  role: "admin",
  createdAt: new Date()
})

EOF
