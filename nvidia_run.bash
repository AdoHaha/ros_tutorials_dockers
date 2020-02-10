XAUTH=/tmp/.docker.xauth

xhost +local:root
docker stop ros_jupyter_container
docker rm ros_jupyter_container



if [ ! -f $XAUTH ]
then
    xauth_list=$(xauth nlist :0 | sed -e 's/^..../ffff/')
    if [ ! -z "$xauth_list" ]
    then
        echo $xauth_list | xauth -f $XAUTH nmerge -
    else
        touch $XAUTH
    fi
    chmod a+r $XAUTH
fi

docker run -it \
    -p 8988:8888 \
    -v `pwd`/pythonowe:/home/costam/pythonowe \
    --env="DISPLAY=$DISPLAY" \
    --env="QT_X11_NO_MITSHM=1" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    -env="XAUTHORITY=$XAUTH" \
    --volume="$XAUTH:$XAUTH" \
    --volume="`pwd`/ipython_robot_prototyping:/home/ubuntu/catkin_ws/src/ipython_robot_prototyping" \
    --runtime=nvidia \
    --name ros_jupyter_container \
    --network host \
    ros_jupyter

   
