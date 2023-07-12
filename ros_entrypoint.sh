#!/bin/bash
set -e

# setup ros environment
source "/opt/ros/humble/setup.bash"
source "/home/indro/colcon_ws/install/setup.bash"
exec "$@"
