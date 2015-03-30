BFROM	phusion/baseimage

R1;2802;0cUN	add-apt-repository ppa:couchdb/stable -y && apt-get update -y && apt-get install -y couchdb nodejs lame vorbis-tools flac faad graphicsmagick git python2.7 make build-essential && mkdir -p /app/10er10


# Install couchdb
RUN	mkdir -p /var/run/couchdb/ && couchdb -b


# Install nodejs
RUN	ln -s /usr/bin/nodejs /usr/bin/node && curl -L http://npmjs.org/install.sh | sh


# Install 10er10
WORKDIR	  /app/10er10
RUN	  git clone http://github.com/dready92/10er10.git /app/10er10 && ln -s /usr/bin/python2.7 /usr/bin/python && npm install
ADD	  config.local.js  /app/10er10/node/config.local.js
WORKDIR	  /app/10er10/node/install
ADD	  install_prod.sh	/app/10er10/node/install/install_prod.sh
RUN	  couchdb -b && timeout 20 sh install_prod.sh ; cd /app/10er10/node/admin

EXPOSE	8124

VOLUME	/app/10er10/musics

ADD	start.sh /app/start.sh

CMD	["sh", "/app/start.sh"]
