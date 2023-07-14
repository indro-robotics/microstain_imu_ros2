#base image
FROM ghcr.io/indro-robotics/indro_base:latest
WORKDIR /home/indro/colcon_ws
# setting up ros environment and cloning all the required repo


RUN source /opt/ros/humble/setup.bash && \
    mkdir src && \
    cd src/ && \
    git clone --recursive --branch ros2 https://github.com/LORD-MicroStrain/microstrain_inertial.git

#installing required python libraries and compiling code      
WORKDIR /home/indro/colcon_ws
RUN apt update
RUN apt upgrade -y
RUN apt-get update && sudo apt-get install ros-humble-microstrain-inertial-driver -y
RUN apt-get update && sudo apt-get install ros-humble-microstrain-inertial-rqt -y
RUN pip install setuptools==58.2.0
RUN source /opt/ros/humble/setup.bash && rosdep install --from-paths src --ignore-src --rosdistro humble -y
RUN source /opt/ros/humble/setup.bash && colcon build
#copying entrypoint file and communication file
WORKDIR /home/indro/colcon_ws
COPY ./ros_entrypoint.sh /home/indro
COPY ./cyclonedds.xml /home/indro
WORKDIR /home/indro
RUN chmod +x ros_entrypoint.sh

RUN source /home/indro/colcon_ws/install/setup.bash
ENTRYPOINT [ "/home/indro/ros_entrypoint.sh" ]
CMD [ "bash" ]
