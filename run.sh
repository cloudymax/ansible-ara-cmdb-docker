#!/bin/bash
# tmux ansible-cmdb python3 required

# build the container image
docker build -t runner . --platform linux/amd64

# gather facts from hosts 
docker run --platform linux/amd64 -it \
  -v $(pwd)/ansible:/ansible \
  -v $(pwd)/ara:/home/root/.ara/server \
  -w /ansible -p 8000:8000 runner /bin/bash

# create an output dir
#mkdir -p ansible/cmdb

# run CMDB against the ansible output
#docker run --platform linux/amd64 -it \
#  -v $(pwd)/ansible:/ansible \
#  -w /ansible \
#  runner /usr/local/bin/ansible-cmdb --template html_fancy_split out

# serve the generated page.
# python3 -m http.server 8080 --directory ansible/cmdb/
