#!/bin/sh

couchdb -b

# Create user
cd /app/10er10/node/admin
node d10-createUser.js $LOGIN $PASSWD -p


/usr/bin/node /app/10er10/node/server.js -p
