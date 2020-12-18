#!/bin/sh
catkin_make && sleep 2
source devel/setup.bash && sleep 2

roslaunch simple_arm robot_spawn.launch && sleep 2

#rosrun simple_arm simple_mover

