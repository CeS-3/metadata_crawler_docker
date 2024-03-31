#!/bin/bash
docker stop metadata_d
docker stop metadata_e
docker stop metadata_f
docker stop metadata_g
docker stop metadata_h
docker stop metadata_i
docker rm metadata_d
docker rm metadata_e
docker rm metadata_f
docker rm metadata_g
docker rm metadata_h
docker rm metadata_i
docker run --name metadata_d --network=metadata_meta -e PREFIX=d -e "API_URL=http://api.proxy.ip2world.com/getProxyIp?num=1&lb=4&return_type=txt&protocol=http" -e MONGO_HOST=mongo -e MONGO_PORT=27017 -e DB_NAME=metadata -v ./../docker_images/data:/data -v ./data:/result --restart=on-failure:3 --detach crawler:latest
docker run --name metadata_e --network=metadata_meta -e PREFIX=e -e "API_URL=http://api.proxy.ip2world.com/getProxyIp?num=1&lb=4&return_type=txt&protocol=http" -e MONGO_HOST=mongo -e MONGO_PORT=27017 -e DB_NAME=metadata -v ./../docker_images/data:/data -v ./data:/result --restart=on-failure:3 --detach crawler:latest
docker run --name metadata_f --network=metadata_meta -e PREFIX=f -e "API_URL=http://api.proxy.ip2world.com/getProxyIp?num=1&lb=4&return_type=txt&protocol=http" -e MONGO_HOST=mongo -e MONGO_PORT=27017 -e DB_NAME=metadata -v ./../docker_images/data:/data -v ./data:/result --restart=on-failure:3 --detach crawler:latest
docker run --name metadata_g --network=metadata_meta -e PREFIX=g -e "API_URL=http://api.proxy.ip2world.com/getProxyIp?num=1&lb=4&return_type=txt&protocol=http" -e MONGO_HOST=mongo -e MONGO_PORT=27017 -e DB_NAME=metadata -v ./../docker_images/data:/data -v ./data:/result --restart=on-failure:3 --detach crawler:latest
docker run --name metadata_h --network=metadata_meta -e PREFIX=h -e "API_URL=http://api.proxy.ip2world.com/getProxyIp?num=1&lb=4&return_type=txt&protocol=http" -e MONGO_HOST=mongo -e MONGO_PORT=27017 -e DB_NAME=metadata -v ./../docker_images/data:/data -v ./data:/result --restart=on-failure:3 --detach crawler:latest
docker run --name metadata_i --network=metadata_meta -e PREFIX=i -e "API_URL=http://api.proxy.ip2world.com/getProxyIp?num=1&lb=4&return_type=txt&protocol=http" -e MONGO_HOST=mongo -e MONGO_PORT=27017 -e DB_NAME=metadata -v ./../docker_images/data:/data -v ./data:/result --restart=on-failure:3 --detach crawler:latest
