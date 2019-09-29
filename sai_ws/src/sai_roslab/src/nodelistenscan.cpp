#include "ros/ros.h"
#include "std_msgs/String.h"
#include "std_msgs/Float64.h"
#include "std_msgs/Float32MultiArray.h"
#include "std_msgs/Header.h"
#include "sensor_msgs/LaserScan.h"



class Listener 
{
public:

    void callback(const sensor_msgs::LaserScan::ConstPtr& msg);


};
//creating a check function 
void Listener::callback(const sensor_msgs::LaserScan::ConstPtr& msg)
{
	std::vector<double> range; 
	ROS_INFO("I heard: [%f]", msg->angle_min);
	ROS_INFO("I heard: [%f]", msg->angle_max);
	ROS_INFO("I heard: [%f]", msg->angle_increment);
	ROS_INFO("I heard: [%f]", msg->time_increment);
	ROS_INFO("I heard: [%f]", msg->scan_time);
	ROS_INFO("I heard: [%f]", msg->range_max);
	ROS_INFO("I heard: [%f]", msg->range_min);



	int size_range = (msg->angle_max - msg->angle_min)/msg->angle_increment;
	for (int i=0 ; i<size_range;i++)
	{
		if(std::isinf(msg->ranges[i] && std::isnan(msg->ranges[i])))
		{
			range.push_back(0);
		 // ROS_INFO("I heard: [%f]", msg->range[i]);
		}

		else{
			range.push_back(msg->ranges[i]);
		}
		

	}

	for (int i=0; i<range.size();i++)
	{
		ROS_INFO("I heard [%f]",range[i]);
	}
	// ROS_INFO("I heard: [%f]", range);
	ROS_INFO("I heard: [%f]", msg->intensities);


}

int main(int argc,char **argv)
{
	ros::init(argc,argv,"listener");
	ros::NodeHandle n;
	Listener l ; 
	ros::Subscriber sub = n.subscribe("/scan", 1000, &Listener::callback,&l);



	ros::spin();
	return 0; 
}