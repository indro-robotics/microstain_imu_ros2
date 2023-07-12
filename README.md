# microstain_imu_ros2

To run microstrain_parker imu inside a docker container.

# Installation:

* Clone this repository on the computer using following command:

```
git clone https://github.com/indro-robotics/microstain_imu_ros2.git
```
# First time setup:
* make sure to select appropriate agilex platform in the docker file.
* login to github to be able to pull image.
  
  ```
  docker login ghcr.io 
  ```
* change the interface in cyclonedds.xml file with appropriate zerotier interface from the robot.
  ```
   <NetworkInterface name="ztbwcfiwzt" priority="default"
  ```
* make ros_entrypoinst.sh an executable file:
  ```
  sudo chmod +x ros_entrypoint.sh
  ```
* run following command to start the container:
  ```
  docker compose up -d
  ```
* to see the logs:
  ```
  docker compose logs
  ```
