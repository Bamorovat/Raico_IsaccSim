# Docker Container Usage Guide

## Starting the Docker Container

To start the **Isaac-Sim** Docker container, run the following command. This command mounts the current directory to `/workspace` inside the container, making your project files accessible within the container:

```bash
# Run Isaac Sim Docker Container
echo "Running Isaac Sim Docker Container..."
docker run --name isaac-sim --entrypoint bash -it --runtime=nvidia --gpus all -e "ACCEPT_EULA=Y" --rm --network=host \
    -e "PRIVACY_CONSENT=Y" \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v ~/docker/isaac-sim/cache/kit:/isaac-sim/kit/cache:rw \
    -v ~/docker/isaac-sim/cache/ov:/root/.cache/ov:rw \
    -v ~/docker/isaac-sim/cache/pip:/root/.cache/pip:rw \
    -v ~/docker/isaac-sim/cache/glcache:/root/.cache/nvidia/GLCache:rw \
    -v ~/docker/isaac-sim/cache/computecache:/root/.nv/ComputeCache:rw \
    -v ~/docker/isaac-sim/logs:/root/.nvidia-omniverse/logs:rw \
    -v ~/docker/isaac-sim/data:/root/.local/share/ov/data:rw \
    -v ~/docker/isaac-sim/documents:/root/Documents:rw \
    nvcr.io/nvidia/isaac-sim:2023.1.0
```

Command breakdown:
- `--gpus all`: Enables GPU access for the container.
- `-it`: Starts the container in interactive mode.
- `--rm`: Removes the container when it is stopped.
- `--name isaac-sim`: Assigns the name `isaac-sim` to the container.

To Start the **Issac-Sim-Humble** Docker Container, run the following command:

```bash
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

## Accessing the Container

If the container is already running, you can access it by using:

```bash
docker exec -it isaac-sim /bin/bash
```
or 
```bash
docker exec -it isaac-sim-humble:latest 
```
This command attaches to the running container, allowing you to interact with it using a bash shell.

## Working Inside the Container

### Navigating to Your Project Directory

Once inside the container, navigate to the `/workspace` directory where your project files are located:

```bash
cd /workspace
```

### Running Your Scripts

You can run your Python scripts or any other commands as needed. For example, to run a Python script named `your_rl_script.py`, use:

```bash
python3 your_rl_script.py
```

## Stopping the Container

### Stopping the Container

To stop the container, exit the interactive mode by typing `exit` or pressing `Ctrl+D`. If you started the container with `--rm`, it will automatically be removed upon exit.


## Managing Docker Images and Containers

### Listing Docker Containers

To list all running Docker containers, use the following command:

```bash
docker ps
```

To list all Docker containers, including stopped containers, use:

```bash
docker ps -a
```

### Removing Docker Containers

To remove a stopped container, use:

```bash
docker rm <container_id>
```

### Listing Docker Images

To list all Docker images on your system, use:

```bash
docker images
```

### Removing Docker Images

To remove a Docker image, use:

```bash
docker rmi <image_id>
```


