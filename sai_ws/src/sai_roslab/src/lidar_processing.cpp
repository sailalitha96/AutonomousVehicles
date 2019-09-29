#include "ros/ros.h"
#include "std_msgs/String.h"
#include "std_msgs/Float64.h"
#include "std_msgs/Float32MultiArray.h"
#include "std_msgs/Header.h"
#include "sensor_msgs/LaserScan.h"
#include "sai_roslab/scan_range.h"

using namespace sai_roslab;
class scan_process
{
private: 
	// use the data received and publish on node closest point and farthest point
	ros::Publisher closest_point_pub ;
	ros::Publisher farthest_point_pub;
	ros::Publisher scan_range_pub;
public:
	scan_process(ros::NodeHandle& n)
	{
	// ros::Publisher temp = n.advertise<std_msgs::Float64>("closest_point",1000);
	closest_point_pub = n.advertise<std_msgs::Float64>("closest_point",1000);
	farthest_point_pub = n.advertise<std_msgs::Float64>("farthest_point",1000);
	scan_range_pub = n.advertise<scan_range>("/scan_range",10);
	}

	void callback(const sensor_msgs::LaserScan::ConstPtr& msg);

	// void publish_points (double closest, double farthest)
	// {
	// 	std_msgs::Float64 msg; 
	// 	msg.data = closest; 
	// 	closest_point.publish(msg);
	// 	msg.data = farthest;
	// 	farthest_point.publish(msg);

	// }
};



//creating a check function 
void scan_process::callback(const sensor_msgs::LaserScan::ConstPtr& msg)
{
	// to print messages 
	// ROS_INFO("I heard: [%f]", msg->angle_min);
	// ROS_INFO("I heard: [%f]", msg->angle_max);
	// ROS_INFO("I heard: [%f]", msg->angle_increment);
	// ROS_INFO("I heard: [%f]", msg->time_increment);
	// ROS_INFO("I heard: [%f]", msg->scan_time);
	// ROS_INFO("I heard: [%f]", msg->range_max);
	// ROS_INFO("I heard: [%f]", msg->range_min);
	float min_range= msg->ranges[0]; 
	float max_range =msg->ranges[0];
	int size_range = (msg->angle_max - msg->angle_min)/msg->angle_increment;
	for (int i=0 ; i<size_range;i++)
	{
		if(std::isinf(msg->ranges[i] && std::isnan(msg->ranges[i])))
		{
			continue; 
		}

		else{

			if(min_range>msg->ranges[i])
			{
				min_range = msg->ranges[i];
			}

			if(max_range<msg->ranges[i])
			{
				max_range= msg->ranges[i];
			}


		}
		

	}
 	// publish_points (min_range, max_range);
	std_msgs::Float64 dt; 
	dt.data = min_range; 
	closest_point_pub.publish(dt);
	dt.data = max_range;
	farthest_point_pub.publish(dt);
 	scan_range custom_msg;
 	custom_msg.header = msg->header;
 	custom_msg.closest_point = min_range;
 	custom_msg.farthest_point = max_range;
 	scan_range_pub.publish(custom_msg);


}



int main(int argc,char **argv)
{
	ros::init(argc,argv,"lidar_node");
	ros::NodeHandle n;
	scan_process scan(n); 
	ros::Subscriber sub = n.subscribe("/scan", 1000, &scan_process::callback,&scan);

	ros::spin();
	return 0; 
}