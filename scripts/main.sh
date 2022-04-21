#!/bin/bash

#Commented lines must be ran manually

# roslaunch ur_gazebo ur5_bringup.launch
# rosrun rviz rviz

(trap 'kill 0' SIGINT; roscore &
roslaunch ur5e_control frame_publisher.launch &
(cd ~/Downloads &&
sh play_data.sh) &
rosrun robotics_lab4 detect_ball.py &
rosrun robot_vision_lectures crop_visualize_3D &
rosrun ur5e_control ur5e_controller &
rosrun ur5e_control task_space_traj &
rosrun robotics_report2 manual_initialization.py &
rosrun robotics_lab6 sphere_fit.py &
wait)

#Wait 10 seconds
# rosrun robotics_report2 simple_planner.py
