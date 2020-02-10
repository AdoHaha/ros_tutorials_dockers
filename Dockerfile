FROM osrf/ros:eloquent-desktop

RUN apt-get update
RUN apt-get install python3-numpy python3-pandas python3-matplotlib --yes


RUN pip3 install numpy scipy pandas matplotlib jupyter

ENTRYPOINT ["/ros_entrypoint.sh"]
CMD ["bash"]



