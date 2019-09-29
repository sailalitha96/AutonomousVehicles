#include <ros/ros.h>
#include <nav_msgs/Odometry.h>
#include <tf/transform_broadcaster.h>
#include <sensor_msgs/LaserScan.h>
#include <ackermann_msgs/AckermannDriveStamped.h>
#include <math.h>

using namespace std; 
 

#define k_p 10
#define k_i 0
#define k_d  2

class WallFollow{

private:
	ros::NodeHandle n;
	double speed;
	int wall_dir; // need to give 

	float a_dir; // from manual dir of beam. 
	float b_dir; // the distance range selected 
	float theta;

	float dist; // cureent distance
	float des_dist; //desired distance 
	float d_prev; // need ot get previous plus look ahead dist - prev distance.
	float d_int; 

	float steering_angle;
	float steering_speed;

	ros::Publisher drive_pub; // message to be published 
	ros::Subscriber scan_pub;
	ros::Subscriber odom_pub;

public:
WallFollow(){

	n = ros::NodeHandle();
	// TODO: create ROS subscribers and publishers
	scan_pub = n.subscribe("/scan",1,&WallFollow::scan_callback,this);
	odom_pub = n.subscribe("/odom",1,&WallFollow::odom_callback,this);
	drive_pub = n.advertise<ackermann_msgs::AckermannDriveStamped>("/nav",1);

	des_dist =1;
}

void odom_callback(const nav_msgs::Odometry::ConstPtr &odom_msg) {
        // TODO: update current speed
        //speed = 0.0;

	speed = odom_msg->twist.twist.linear.x;


    }

void scan_callback(const sensor_msgs::LaserScan::ConstPtr &scan_msg)
{
	int a_i;
	int b_i;


		b_i = scan_msg->ranges.size()/4;
		// taking 45 as the angle and convert to radians 
		a_i = b_i + int(((45*M_PI)/180)/scan_msg->angle_increment);
		theta = (a_i -b_i) * scan_msg->angle_increment; 
	


	//check fo nan and inf 
	if(!(std::isnan(scan_msg->ranges[b_i])&& std::isinf(scan_msg->ranges[b_i])))
	{
		b_dir = scan_msg->ranges[b_i];

	}
	if(!(std::isnan(scan_msg->ranges[a_i]&& std::isinf(scan_msg->ranges[a_i]))))
	{
		a_dir = scan_msg->ranges[a_i];

	}


}

void wall_dist()
{ // use the tan function given to checked for angle to collision 

	double angle_wall = atan((a_dir*cos(theta)-b_dir)/(a_dir*sin(theta)));
	dist = b_dir*cos(angle_wall);
	// this distance is curr , add a look ahead distance 
	dist += speed * 0.25 * sin(angle_wall); 
}

void pid_control(double df)
{
	float err_d = des_dist- dist;
	steering_angle = k_p*err_d +k_d*(dist-d_prev)/df +k_i*d_int;
	d_int += err_d * df;
	d_prev = dist; 

	if(0<= abs(steering_angle) && abs(steering_angle)<10){
		steering_speed=1.5;
	}
	else if(10<=abs(steering_angle) && abs(steering_angle)<20){
		steering_speed =1.0;
	}
	else { 
		steering_speed=0.5;
	}

	ackermann_msgs::AckermannDriveStamped ack_msg;
	ack_msg.drive.steering_angle = steering_angle;
	ack_msg.drive.speed = steering_speed;
	ack_msg.drive.steering_angle_velocity = 1.0;
	drive_pub.publish(ack_msg);
}



};

int main(int argc, char ** argv) {
    ros::init(argc, argv, "wallfollow_node");
    WallFollow wf;
    double now_time=0;
    double df;
    double prev_time = ros::Time::now().toSec();
    while(ros::ok())
    {
    	wf.wall_dist();
    	now_time = ros::Time::now().toSec();
        df = now_time-prev_time;

    	prev_time = now_time;
    	wf.pid_control(df);

    	ros::spinOnce();



    }
    // ros::spin();
    return 0;
}
