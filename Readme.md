Files for ROS workshop 

git clone --recurse-submodules -j8 https://github.com/AdoHaha/ros_tutorials_dockers.git

The container (for Intel processor and GPU) is available at dockerhub

docker pull adohaha/ros_tutorial:latest

To run use
./intel_run_hub.bash


To run not as root:

 sudo groupadd docker
sudo usermod -aG docker `whoami`

Log out and log back in so that your group membership is re-evaluated.

