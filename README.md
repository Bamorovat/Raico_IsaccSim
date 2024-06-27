# Isaac Sim Docker Setup

This guide provides instructions to set up a Docker environment for Isaac Sim, including necessary prerequisites and setup steps.

## Prerequisites

### 1. Install NVIDIA Driver

Ensure the necessary packages are installed using the following commands:

```sh
sudo apt-get update
sudo apt install build-essential -y
```
Ensure the NVIDIA driver is installed. The recommended version is 535.129.03 for Linux.

Since NVIDIA installed before, **you can ignore the following steps**. If not, you can install the NVIDIA driver using the following commands:
```sh
wget https://us.download.nvidia.com/XFree86/Linux-x86_64/535.129.03/NVIDIA-Linux-x86_64-535.129.03.run
chmod +x NVIDIA-Linux-x86_64-535.129.03.run
sudo ./NVIDIA-Linux-x86_64-535.129.03.run
```

### 2. Install Docker

Install Docker using the following commands:

```sh
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
docker run  hello-world
```

### 3. Install NVIDIA Container Toolkit

Install the NVIDIA Container Toolkit using the following commands:

```sh
curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg
curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list | \
    sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
    sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list
sudo apt-get update
sudo apt-get install -y nvidia-container-toolkit
sudo systemctl restart docker
sudo nvidia-ctk runtime configure --runtime=docker
sudo systemctl restart docker
docker run --rm --runtime=nvidia --gpus all ubuntu nvidia-smi
```

## Instructions for Team Members

### Make the Script Executable

Open your terminal and navigate to the directory where you saved the script. Run the following command to make the script executable:

```sh
chmod +x setup_isaac_sim_docker.sh
```

### Run the Script

Before running the script, ensure that you have generated your **NGC API Key**. You can generate your API Key by following the instructions in the [NVIDIA NGC Documentation](https://docs.nvidia.com/ngc/ngc-overview/index.html#generating-api-key).

Run the script using the following command:

```sh
./setup_isaac_sim_docker.sh
```

This script automates the setup and execution of the Isaac Sim Docker container, including necessary mounts and environment variables. Each team member can run this script to set up their environment correctly.

For more detailed information, refer to the [Isaac Sim Docker Setup](https://docs.omniverse.nvidia.com/isaacsim/latest/installation/install_container.html) documentation.


This `README.md` file includes all the necessary steps for setting up the NVIDIA driver, Docker, and the NVIDIA Container Toolkit, followed by the script to run Isaac Sim in a Docker container. Each team member can follow these instructions to get their environment set up correctly.



