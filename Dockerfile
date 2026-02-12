# Base image
FROM ubuntu:noble

# Define the workspace folder (e.g. where to place your code)
# We define a variable so that we can re-use it
ENV WS_DIR="/orion_ws"
WORKDIR ${WS_DIR}

# Copy your code into the folder (see later for better alternatives!)


# Use Bourne Again Shell as default shell
# SHELL ["/bin/bash", "-c"] 

# Disable user dialogs in apt installation messages
ARG DEBIAN_FRONTEND=noninteractive

# Commands to perform on base image
# RUN apt-get -y update \
#  && apt-get -y install some_package \
#  && git clone https://github.com/some_user/some_repository some_repo \
#  && cd some_repo \
#  && mkdir build \
#  && cd build \
#  && cmake .. \
#  && make -j$(nproc) \
#  && make install \
#  && rm -rf /var/lib/apt/lists/*

RUN apt-get update && \
    apt-get install -y locales && \
    locale-gen en_US en_US.UTF-8 && \
    update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8 && \
    rm -rf /var/lib/apt/lists/*

ENV LANG=en_US.UTF-8 \
    LC_ALL=en_US.UTF-8

# RUN apt-get update && \
#     apt-get install -y curl apt-transport-https && \
#     export ROS_APT_SOURCE_VERSION=$(curl -s https://api.github.com/repos/ros-infrastructure/ros-apt-source/releases/latest | grep -F "tag_name" | awk -F\" '{print $4}') && \
#     curl -L -o /tmp/ros2-apt-source.deb "https://github.com/ros-infrastructure/ros-apt-source/releases/download/${ROS_APT_SOURCE_VERSION}/ros2-apt-source_${ROS_APT_SOURCE_VERSION}.$(. /etc/os-release && echo ${UBUNTU_CODENAME:-${VERSION_CODENAME}})_all.deb" && \
#     dpkg -i /tmp/ros2-apt-source.deb &&\
#     apt-get install ros-jazzy-ros-base

RUN apt-get update && \
    apt-get install -y software-properties-common curl apt-transport-https && \
    add-apt-repository universe

# Get latest ROS 2 apt source version and install it
RUN export ROS_APT_SOURCE_VERSION=$(curl -s https://api.github.com/repos/ros-infrastructure/ros-apt-source/releases/latest \
        | grep -F "tag_name" | awk -F\" '{print $4}') && \
    curl -L -o /tmp/ros2-apt-source.deb "https://github.com/ros-infrastructure/ros-apt-source/releases/download/${ROS_APT_SOURCE_VERSION}/ros2-apt-source_${ROS_APT_SOURCE_VERSION}.$(. /etc/os-release && echo ${UBUNTU_CODENAME:-${VERSION_CODENAME}})_all.deb" && \
    dpkg -i /tmp/ros2-apt-source.deb && \
    apt-get update && \
    apt-get install -y ros-jazzy-ros-base && \
    rm -f /tmp/ros2-apt-source.deb && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# RUN source /opt/ros/jazzy/setup.bash

COPY . ${WS_DIR}
# Enable apt user dialogs again
ARG DEBIAN_FRONTEND=dialog

RUN chmod +x /orion_ws/entrypoint.sh

# Define the script that should be launched upon start of the container
ENTRYPOINT ["/orion_ws/entrypoint.sh"]