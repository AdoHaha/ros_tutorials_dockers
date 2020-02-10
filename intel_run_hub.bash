XAUTH=/tmp/.docker.xauth

xhost +local:root
docker stop ros_jupyter_container
docker rm ros_jupyter_container


USER_UID=$(id -u)


   
xhost +
docker run -it\
    -p 8988:8888 \
    -v `pwd`/pythonowe:/home/costam/pythonowe \
        --env="QT_X11_NO_MITSHM=1" \
  --volume=/tmp/.X11-unix:/tmp/.X11-unix \
  --device=/dev/snd:/dev/snd \
   --group-add video \
  --device=/dev/dri:/dev/dri \
   --volume /tmp/pulseaudio.socket:/tmp/pulseaudio.socket \
    --volume="`pwd`/ipython_robot_prototyping:/home/ubuntu/catkin_ws/src/ipython_robot_prototyping" \
  --env="DISPLAY=$DISPLAY" \
      --name ros_jupyter_container \
      --network host \
    adohaha/ros_tutorial:latest


#xhost +
#docker run \
#  --volume=/tmp/.X11-unix:/tmp/.X11-unix \
 # --device=/dev/dri:/dev/dri \
 # --env="DISPLAY=$DISPLAY" \
  #your_image
