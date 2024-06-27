#!/bin/bash

# Log in to NGC
echo "Logging in to NGC..."
#docker login nvcr.io

# Prompt for NGC API Key
echo "Please enter your NGC API key:"
read -s NGC_API_KEY

# Log in to the NVIDIA NGC registry
docker login nvcr.io -u '$oauthtoken' -p $NGC_API_KEY

# Pull Isaac Sim Docker Image
echo "Pulling Isaac Sim Docker Image..."
docker pull nvcr.io/nvidia/isaac-sim:2023.1.0

# Run Isaac Sim Docker Container
echo "Running Isaac Sim Docker Container..."
docker run --name isaac-sim --entrypoint bash -it --runtime=nvidia --gpus all -e "ACCEPT_EULA=Y" --rm --network=host \
    -e "PRIVACY_CONSENT=Y" \
    -v ~/docker/isaac-sim/cache/kit:/isaac-sim/kit/cache:rw \
    -v ~/docker/isaac-sim/cache/ov:/root/.cache/ov:rw \
    -v ~/docker/isaac-sim/cache/pip:/root/.cache/pip:rw \
    -v ~/docker/isaac-sim/cache/glcache:/root/.cache/nvidia/GLCache:rw \
    -v ~/docker/isaac-sim/cache/computecache:/root/.nv/ComputeCache:rw \
    -v ~/docker/isaac-sim/logs:/root/.nvidia-omniverse/logs:rw \
    -v ~/docker/isaac-sim/data:/root/.local/share/ov/data:rw \
    -v ~/docker/isaac-sim/documents:/root/Documents:rw \
    nvcr.io/nvidia/isaac-sim:2023.1.0
