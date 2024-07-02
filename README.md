# Isaac Sim Docker Image with ROS 2 Humble

## Introduction

Welcome to the Isaac Sim Humble Docker setup guide. This document provides comprehensive instructions on how to download, load, and use the `isaac-sim-humble` Docker image, which includes both Isaac Sim and ROS 2 Humble. 

For more detailed instructions on specific tasks, you can refer to the following additional documentation:
- **`Isaac-Sim Docker Setup.md`**: This file includes detailed information on the setup and configuration of the original Isaac Sim Docker container.
- **`help.md`**: This file provides detailed help on using the Docker image, including running the container and troubleshooting common issues.

## Table of Contents

1. [Introduction](#introduction)
2. [Prerequisites](#prerequisites)
2. [Downloading the Docker Image](#downloading-the-docker-image)
3. [Loading the Docker Image](#loading-the-docker-image)
4. [Running the Docker Container](#running-the-docker-container)
5. [Using ROS 2 Inside the Container](#using-ros-2-inside-the-container)

## Prerequisites

Before you begin, ensure you have the following:
- Docker installed on your local machine. You can download and install Docker from [here](https://www.docker.com/products/docker-desktop).
- Access to the internet to download the Docker image from SharePoint.

## Downloading the Docker Image

1. **Open your web browser** and navigate to the following SharePoint link:
   [Download Isaac Sim Docker Image](https://livemanchesterac.sharepoint.com/:u:/r/sites/UOM-FSE-EEE-REEL-at-RAICo/Shared%20Documents/General/REEL/Software/Docker_Images/isaac-sim-humble.tar?csf=1&web=1&e=AC90V3)

2. **Download the `isaac-sim-humble.tar` file** to a directory on your local machine. Ensure that you have enough space as the file is quite large.

## Loading the Docker Image

1. **Open a terminal** on your local machine.

2. **Navigate to the directory** where you downloaded the `isaac-sim-humble.tar` file. Replace `/path/to/download/directory` with the actual path to the directory:
   ```sh
   cd /path/to/download/directory
    ```
3. **Load the Docker image** using the following command:
   ```sh
   docker load -i isaac-sim-humble.tar
   ```
    This command imports the Docker image into your local Docker environment. You should see output indicating that the image is being loaded.

## Running the Isaac SIm Humble Docker Container

1. Start the Docker container using the following command:

```bash
# Run Isaac Sim Humble Docker Container
echo "Running Isaac Sim Docker Container..."
docker run --entrypoint bash -it --runtime=nvidia --gpus all -e "ACCEPT_EULA=Y" --rm --network=host \
    -e "PRIVACY_CONSENT=Y" \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v ~/docker/isaac-sim-humble/cache/kit:/isaac-sim-humble/kit/cache:rw \
    -v ~/docker/isaac-sim-humble/cache/ov:/root/.cache/ov:rw \
    -v ~/docker/isaac-sim-humble/cache/pip:/root/.cache/pip:rw \
    -v ~/docker/isaac-sim-humble/cache/glcache:/root/.cache/nvidia/GLCache:rw \
    -v ~/docker/isaac-sim-humble/cache/computecache:/root/.nv/ComputeCache:rw \
    -v ~/docker/isaac-sim-humble/logs:/root/.nvidia-omniverse/logs:rw \
    -v ~/docker/isaac-sim-humble/data:/root/.local/share/ov/data:rw \
    -v ~/docker/isaac-sim-humble/documents:/root/Documents:rw \
    isaac-sim-humble:latest
```

This command does the following:

- `--entrypoint bash`: Ensures that the entry point is set to bash.
- `-it`: Runs the container in interactive mode with a terminal.
- `--runtime=nvidia`: Specifies the use of NVIDIA runtime.
- `--gpus all`: Allocates all GPUs to the container.
- `-e "ACCEPT_EULA=Y"` and `-e "PRIVACY_CONSENT=Y"`: Sets environment variables to accept the EULA and privacy consent.
- `--rm`: Automatically removes the container when it exits.
- `--network=host`: Uses the host's network stack.
- `-e DISPLAY=$DISPLAY`: Sets the DISPLAY environment variable for X11 forwarding.
- `-v /tmp/.X11-unix:/tmp/.X11-unix`: Mounts the X11 socket.
- Other `-v` options: Mounts various directories for caching and logging purposes.

2. Verify you are inside the container by checking the command prompt. It should look something like this:
    ```sh
    root@<container_id>:/#
    ```
    This indicates that you are inside the Docker container.

## Using ROS 2 Inside the Docker Container

1. Source the ROS 2 setup script by running the following command inside the container:
    ```sh
    source /opt/ros/humble/setup.bash
    ```
    This command sets up the ROS 2 environment inside the container.

2. Verify that ROS 2 is installed correctly by running the following command:
    ```sh
    ros2 --help
    ros2 pkg list
    ```
    This commands should display the ROS 2 help message and a list of installed ROS 2 packages.

