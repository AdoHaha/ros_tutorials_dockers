#!/bin/bash
set -e

# setup ros environment
export ROS_DISTRO=kinetic
source "/opt/ros/$ROS_DISTRO/setup.bash"
exec "$@"
