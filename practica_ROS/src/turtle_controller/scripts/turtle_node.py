#!/usr/bin/env python3
import rospy
import sys
from geometry_msgs.msg import Twist
from std_msgs.msg import String, Int8, Int16, Int32
from robobo_msgs.srv import MoveWheels
from robobo_msgs.msg import *
import random
import time

TEST = "TOPIC"

def call_service(lspeed, rspeed, timem, blockid=0):
    rospy.wait_for_service('robot/robobo/moveWheels')
    #rate = rospy.Rate(10) # 10hz
    moveWheels = rospy.ServiceProxy('robot/robobo/moveWheels', MoveWheels)
    resp1 = moveWheels(Int8(lspeed), Int8(rspeed), Int32(timem), Int16(blockid))
    return resp1.error.data


def call_topic(lspeed, rspeed, timem, blockid=0):
    pub = rospy.Publisher('robot/robobo/moveWheels', MoveWheelsCommand, queue_size=10)
    rospy.sleep(1)
    pub.publish(MoveWheelsCommand(Int8(lspeed), Int8(rspeed), Int32(timem), Int16(blockid)))


if __name__ == '__main__':
    rospy.init_node("turtle_random")
    rospy.logdebug("Node start.")

    publisher = rospy.Publisher("/turtle1/cmd_vel", Twist, queue_size=10)
#    publisher_robobo = rospy.ServiceProxy("/robot/robobo/moveWheels", MoveWheels)
    
    if TEST == "TOPIC":
        call_fun = call_topic
    else:
        call_fun = call_service


    rate = rospy.Rate(1)
    while not rospy.is_shutdown():
        z = random.uniform(-4,4)
        if z >0:
            l=int(z*20)
            r=0
        else:
            l=0
            r=int((-1)*z*20)     
        lspeed = rospy.get_param("~lspeed",l)
        rspeed = rospy.get_param("~rspeed",r)
        timem   = rospy.get_param("~time",1000)
        print ("Got args: %d, %d, %d"%(lspeed, rspeed, timem))
        call_fun(lspeed, rspeed, timem)

        msg = Twist()  
        msg_rob = Twist()
        msg.linear.x =0
        msg.angular.z = z
        publisher.publish(msg)
        rate.sleep()
        #publisher_robobo(Int8(z*10),Int8(0), Int32(1000), Int16(0))
        time.sleep(1)
        lspeed = rospy.get_param("~lspeed",100)
        rspeed = rospy.get_param("~rspeed",100)
        timem   = rospy.get_param("~time",1000)
        print ("Got args: %d, %d, %d"%(lspeed, rspeed, timem))
        call_fun(lspeed, rspeed, timem)
        
        msg.angular.z = 0
        msg.linear.x = 2
        publisher.publish(msg)
        rate.sleep()
        #publisher_robobo(Int8(20),Int8(20), Int32(1000), Int16(0))
        time.sleep(1)

