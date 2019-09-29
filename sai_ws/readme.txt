sai_ws is the name of the workspace
sai_ws/src contains sai_roslab - package 
sai_roslab/src contains
--- listener.cpp - a sample subscriber 
--- talker.cpp - a sample publisher
--- lidar_processing.cpp - the node which subscribes to laserscan data and processes it.
--- nodelistenscan.cpp -- a template file for testing
--- samplepub.cpp - a template file for testing 

sai_roslab / sai_roslab.launch - it launches the rviz which only laser scan data as well our lidar_node 

sai_roslab/msg -
--- scan_range - it includes the header and custom message type for closest and farthest point.

Lab 2 - SAFETY LAB

package name sai_safety -- the package for the safety_node.cpp

sai_safety/safety_node -- thsi is nde which estimates the time for collision 

run command rosrun sai_safety safety_node
Package name Sai_wall 

sai_wall/src / wall_follwoing - this is node for following a particular wall. 

run command rosrun sai_wall wall_following
