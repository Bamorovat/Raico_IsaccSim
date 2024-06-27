# Docker Container Usage Guide

## Starting the Docker Container

To start the Docker container, run the following command. This command mounts the current directory to `/workspace` inside the container, making your project files accessible within the container:

```bash
docker run --gpus all -it --rm --name rl-container -v $(pwd):/workspace rl-isaac-sim-pytorch-ros2
```

Command breakdown:
- `--gpus all`: Enables GPU access for the container.
- `-it`: Starts the container in interactive mode.
- `--rm`: Removes the container when it is stopped.
- `--name rl-container`: Assigns the name `rl-container` to the container.
- `-v $(pwd):/workspace`: Mounts the current directory to `/workspace` inside the container.

## Accessing the Container

If the container is already running, you can access it by using:

```bash
docker exec -it rl-container /bin/bash
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


