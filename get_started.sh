#!/bin/bash

# Directory this file was executed from
echo "================================================================"
echo "Starting first time installation and setup, please wait"
echo "these downloads can take a while if you're on slow internet."
echo "================================================================"

# The current directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"


echo "================================================================"
echo "Setting up your shell config files"
echo "================================================================"
# Shell config files that various shells source when they run.
# This is where we want to add aliases, source ROS environment
# variables, etc.
SHELL_CONFIG_FILES=(
    "$HOME/.bashrc"\
    "$HOME/.zshrc"
)

# All lines listed here will be added to the shell config files
# listed above, if they are not present already
declare -a new_shell_config_lines=(
    # Source the ROS Environment Variables Automatically
    "source /opt/ros/melodic/setup.sh"\
    # Make sure that all shells know where to find our custom gazebo models,
    # plugins, and resources. Make sure to preserve the path that already exists as well
    "export GAZEBO_MODEL_PATH=$DIR/src/sb_gazebo/models:${GAZEBO_MODEL_PATH}"\
    "export GAZEBO_PLUGIN_PATH=$DIR/src/sb_gazebo/lib:${GAZEBO_PLUGIN_PATH}"\
    "export GAZEBO_RESOURCE_PATH=$DIR/src/sb_gazebo/models:${GAZEBO_RESOURCE_PATH}"\
    # Aliases to make development easier
    "alias clion=\"clion & disown && exit\""\
    "alias rviz=\"rviz & disown && exit\""\
    "alias rqt=\"rqt & disown && exit\""
)

# Add all of our new shell config options to all the shell
# config files, but only if they don't already have them
for file_name in "${SHELL_CONFIG_FILES[@]}"; 
do
    echo "Setting up $file_name"
    for line in "${new_shell_config_lines[@]}"; 
    do
        if ! grep -Fq "$line" $file_name 
        then
            echo "$line" >> $file_name 
        fi
    done
done


echo "================================================================"
echo "Giving user correct permissions"
echo "================================================================"

# Add the user to the dialout so they can do arduino things
sudo adduser $USER dialout

###############
# Install ROS #
###############

echo "================================================================" 
echo "Installing ROS Kinetic"
echo "================================================================"

sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
sudo apt-get update -y
sudo apt-get install ros-melodic-desktop-full -y

# Initialize rosdep
sudo rosdep init
rosdep update

#################
# Install CLion #
#################

echo "================================================================"
echo "Installing CLion"
echo "================================================================"
sudo snap install clion --classic

##############################
# Install Other Dependencies #
##############################
cd $DIR
./install_dependencies.sh

echo "================================================================"
echo "Finished first time installation and setup; you're good to go!"
echo "If you're working with arduino, or any usb devices, please log"
echo "out and login again for the required changes to take effect"
echo "================================================================"
