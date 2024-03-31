#!/bin/bash

# Clean env
sudo docker stop imagename_crawler
sudo docker rm imagename_crawler
sudo docker rmi images

# Build the image
sudo docker build -t images .

# Define the list of prefixes
prefix_list="defghi"

# Loop through each prefix
for prefix in $(echo $prefix_list | sed "s/\(.\)/\1 /g")
do
    # Run & Test with current prefix
    sudo docker run -d --name imagename_crawler -v $(pwd)/data:/result -v $(pwd)/../keywords/data:/data -e PREFIX=$prefix images
    sudo docker logs -f imagename_crawler

    # Clean up container
    sudo docker stop imagename_crawler
    sudo docker rm imagename_crawler
done
