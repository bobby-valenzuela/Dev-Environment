#!/bin/bash
# Check if user is root (UID 0) or using sudo
if [ "$EUID" -ne 0 ]; then
    echo "This script must be run as root or with sudo."
    exit 1
fi


# Define the container name or ID
IMAGE_NAME="ubuntu-nvim"
CONTAINER_NAME="ubuntu-nvim-container"  # Replace with your container name or ID
LOCAL_BIND_MOUNT_DIR=/home/control-io/
CONTAINER_BIND_MOUNT_DIR=/app

# Define the image name and tag
TAG="v1"
FULL_IMAGE="$IMAGE_NAME:$TAG"

# Check if the image exists locally
IMAGE_ID=$(docker images -q "$FULL_IMAGE")

if [ -n "$IMAGE_ID" ]; then
    echo "Image '$FULL_IMAGE' already exists with ID: $IMAGE_ID"
else
    echo "Image '$FULL_IMAGE' does not exist. Building from Dockerfile..."

    # Create Dockerfile

cat <<EOF > Dockerfile
# Base image
FROM ubuntu:22.04

# Set working directory
WORKDIR /app

# Copy application files
COPY ./home/control-io/www-core/ .

# Update apt cache and install neovim
RUN apt-get update && apt-get install -y python3
RUN  apt-get install neovim -y
RUN  apt install git -y
RUN  apt install fzf -y
RUN  apt install ripgrep -y
RUN  apt install gcc curl tar -y
RUN  apt install lua5.4 -y
RUN  apt install zsh -y
RUN  apt install wget -y
RUN  apt install make gcc unzip git-all xclip build-essential p7zip-full jq locatesshpass xsel cmake libstdc++6 -y

# Here, we use a specific version; replace with desired version or use the dynamic method below
ARG LAZYGIT_VERSION=0.40.2

# Download and install lazygit
RUN curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz" \
    && tar xf lazygit.tar.gz lazygit \
    && mv lazygit /usr/local/bin/ \
    && rm lazygit.tar.gz
EOF

    # Build the image from Dockerfile
    BUILD_OUTPUT=$(docker build -t "$FULL_IMAGE" .)

    # Check if build succeeded
    if [ $? -eq 0 ]; then
        # Get the new image ID
        IMAGE_ID=$(docker images -q "$FULL_IMAGE")
        echo "Image '$FULL_IMAGE' built successfully with ID: $IMAGE_ID"
    else
        echo "Failed to build image '$FULL_IMAGE'."
        exit 1
    fi
fi




# Check if the container is running

if [ "$(docker ps -q -f name=$CONTAINER_NAME)" ]; then

    echo "Container '$CONTAINER_NAME' is running. Connecting to it..."

    docker exec -it $CONTAINER_NAME /usr/bin/zsh

else

    echo "Container '$CONTAINER_NAME' is not running."



    # Check if the container exists (stopped)

    if [ "$(docker ps -aq -f name=$CONTAINER_NAME)" ]; then

        echo "Found Container. Starting container '$CONTAINER_NAME'..."
        docker start $CONTAINER_NAME

        # Connect to the container after starting it
        echo "Connecting to '$CONTAINER_NAME'..."
        docker exec -it $CONTAINER_NAME /usr/bin/zsh


    else

        echo "Container '$CONTAINER_NAME' does not exist. Creating and starting it..."

        # Replace the following line with your container creation command
        # docker run -d --name $CONTAINER_NAME ubuntu /bin/bash
        docker run -it -v ${LOCAL_BIND_MOUNT_DIR}:${CONTAINER_BIND_MOUNT_DIR} --name ${CONTAINER_NAME} ${IMAGE_ID}

    fi



fi
