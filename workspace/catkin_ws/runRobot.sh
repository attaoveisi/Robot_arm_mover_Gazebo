#!/bin/sh
catkin_make
source devel/setup.bash
roslaunch simple_arm robot_spawn.launch
sleep 10 
rosrun simple_arm simple_mover
