# orion-vi-navigation-stack
Navigation stack for orion VI rover

# create a dev enivroment

```
distrobox create --image docker.io/library/ubuntu:noble --home ~/Distrobox/Orion --nvidia --name ros-developement-experience && distrobox enter ros-developement-experience
```

```
sudo apt install software-properties-common -y && sudo add-apt-repository universe -y
```

```
sudo apt update && sudo apt install curl -y
export ROS_APT_SOURCE_VERSION=$(curl -s https://api.github.com/repos/ros-infrastructure/ros-apt-source/releases/latest | grep -F "tag_name" | awk -F\" '{print $4}')
curl -L -o /tmp/ros2-apt-source.deb "https://github.com/ros-infrastructure/ros-apt-source/releases/download/${ROS_APT_SOURCE_VERSION}/ros2-apt-source_${ROS_APT_SOURCE_VERSION}.$(. /etc/os-release && echo ${UBUNTU_CODENAME:-${VERSION_CODENAME}})_all.deb"
sudo dpkg -i /tmp/ros2-apt-source.deb
```

```
sudo apt update && sudo apt install ros-dev-tools ros-jazzy-desktop -y
```

```
echo "source /opt/ros/jazzy/setup.bash" >> ~/.bashrc
source /opt/ros/jazzy/setup.bash
```

```
curl -fsSL https://packages.microsoft.com/keys/microsoft.asc | sudo gpg --dearmor -o /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64 signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'

```

```
sudo add-apt-repository ppa:zhangsongcui3371/fastfetch -y 
```

```
sudo apt update && sudo apt install code fastfetch -y

```

```
distrobox-export code
```
