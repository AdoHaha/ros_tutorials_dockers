download_docker:
	docker pull osrf/ros:eloquent-desktop

run_interactive:
	docker run --name ros2_jupyter_container -it ros2_jupyter
replace_docker:
	xhost +local:root
	-docker stop ros2_jupyter_container
	-docker rm ros2_jupyter_container
	docker run -p 8988:8888 -v `pwd`/pythonowe:/home/costam/pythonowe -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=${DISPLAY} --name ros2_jupyter_container -it  ros2_jupyter
	
replace_docker_indigo:
	xhost +local:root
	-docker stop ros_jupyter_container
	-docker rm ros_jupyter_container
	docker run -p 8988:8888 -v `pwd`/pythonowe:/home/costam/pythonowe -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=${DISPLAY} --name ros_jupyter_container -it  ros_jupyter
	
	
compile_indigo_docker:
	docker build -f Dockerfile_indigo -t ros_jupyter .

compile_kinetic_docker:
	docker build -f Dockerfile_kinetic -t ros_jupyter .	

compile_kinetic_intel_docker:
	docker build -f Dockerfile_kinetic_intel2 -t ros_jupyter_intel .	
compile_docker:
	docker build -t ros2_jupyter .


nowy_terminal:
	-docker container exec -it ros_jupyter_container bash 
	
