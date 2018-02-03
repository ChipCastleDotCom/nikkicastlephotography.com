# nikkicastlephotography.com

# DOES NOT use mup or docker

# list docker containers on server
docker ps

# remove containers
docker stop <container-id>

# uses node 4.8 locally
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | bash
nvm install --lts=argon
nvm use 4.8

# install mupc instead of mup or mupx
npm i -g mupc

# Fix file not found bug
# cp example mupc.json and settings.json files from mupc repo
# https://github.com/aadamsx/meteor-up-classic

# init
mupc init

# store config under gist
https://gist.github.com/chip/dfd664f8a7e2e6d0cfa77e809223b57f

# setup
mupc setup

# deploy
mupc deploy

# configure nginx to serve static files from cfs in /etc/nginx/sites-enabled/nikkicastlephotography.com
location /cfs/ {
}

# reload nginx
sudo service nginx reload

# after each deploy, manually create a symlink to the cfs files
cd /opt/nikkicastlephotographydotcom/app
sudo ln -s ../cfs cfs
