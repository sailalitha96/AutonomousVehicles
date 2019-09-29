#include <ros/ros.h>
#include <nav_msgs/Odometry.h>
#include <sensor_msgs/LaserScan.h>
#include<ackermann_msgs/AckermannDriveStamped.h>
#include<math.h>
#include "std_msgs/Header.h"
#include<std_msgs/Bool.h>
#include<geometry_msgs/Quaternion.h>
#include<tf/LinearMath/Quaternion.h>
#include "tf/tf.h"
#include <tf/transform_datatypes.h>
using namespace std;
// TODO: include ROS msg type headers and libraries


class Safety {
// The class that handles emergency braking
private:
    ros::NodeHandle n;
    double speed;
    double yaw_dir;  
    // TODO: create ROS subscribers and publishers
	ros::Publisher brake_pub;
	ros::Publisher brake_bool_pub;
	ros::Subscriber scan_pub;
	ros::Subscriber odom_pub;

public:
    Safety() {
        n = ros::NodeHandle();
        speed = 0.0;
        /*
        One publisher should publish to the /brake topic with an
        ackermann_msgs/AckermannDriveStamped brake message.
        One publisher should publish to the /brake_bool topic with a
        std_msgs/Bool message.
        You should also subscribe to the /scan topic to get the
        sensor_msgs/LaserScan messages and the /odom topic to get
        the nav_msgs/Odometry messages
        The subscribers should use the provided odom_callback and 
        scan_callback as callback methods
        NOTE that the x component of the linear velocity in odom is the speed
        */

        // TODO: create ROS subscribers and publishers
	scan_pub = n.subscribe("/scan",1,&Safety::scan_callback,this);
	odom_pub = n.subscribe("/odom",1,&Safety::odom_callback,this);
	brake_pub = n.advertise<ackermann_msgs::AckermannDriveStamped>("/brake",1);
	brake_bool_pub = n.advertise<std_msgs::Bool>("/brake_bool",1);
 
        
    }
    void odom_callback(const nav_msgs::Odometry::ConstPtr &odom_msg) {
        // TODO: update current speed
        //speed = 0.0;
	tf::Quaternion quat;
	// current speed is the linear x 
	speed = odom_msg->twist.twist.linear.x;
	// convert geometry msg to tf2
	quaternionMsgToTF(odom_msg->pose.pose.orientation,quat);
	yaw_dir = quat.getAngle();

    }

    void scan_callback(const sensor_msgs::LaserScan::ConstPtr &scan_msg) {
        // TODO: calculate TTC
	double beam_dir;
	vector<double> ttc;
	for(int i =0;i<scan_msg->ranges.size();i++)
	{
		// beam_dir = (scan_msg->angle_increment*i)+scan_msg->angle_min;
		beam_dir = scan_msg->angle_min +(scan_msg->angle_increment*i); 
	// speed component in beam_dir 
		if(!(std::isinf(scan_msg->ranges[i]) && std::isnan(scan_msg->ranges[i])))
		{	double time = (scan_msg->ranges[i]/ (speed*cos(beam_dir)));
			cout << time <<endl;
			if(time>0)
			{ttc.push_back(time);}

		}
	
	}
	sort(ttc.begin(),ttc.end());
 
	ackermann_msgs::AckermannDriveStamped ack_msg;
	std_msgs::Bool bool_msg;
	bool_msg.data= true;

	// TODO: publish drive/brake message

	if(ttc[0] <= 0.5)
	{// if the collision is immimnet , then make speed 0 
	brake_bool_pub.publish(bool_msg);
	ack_msg.drive.speed= 0; 
	brake_pub.publish(ack_msg);
	}
}
    

};
int main(int argc, char ** argv) {
    ros::init(argc, argv, "safety_node");
    Safety sn;
    ros::spin();
    return 0;
}
