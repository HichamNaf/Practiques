/*********************************************************************
* Software License Agreement (BSD License)
*
*  Copyright (c) 2016, Kentaro Wada.
*  All rights reserved.
*
*  Redistribution and use in source and binary forms, with or without
*  modification, are permitted provided that the following conditions
*  are met:
*
*   * Redistributions of source code must retain the above copyright
*     notice, this list of conditions and the following disclaimer.
*   * Redistributions in binary form must reproduce the above
*     copyright notice, this list of conditions and the following
*     disclaimer in the documentation and/or other materials provided
*     with the distribution.
*   * Neither the name of the Kentaro Wada nor the names of its
*     contributors may be used to endorse or promote products derived
*     from this software without specific prior written permission.
*
*  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
*  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
*  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
*  FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
*  COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
*  INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
*  BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
*  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
*  CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
*  LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
*  ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
*  POSSIBILITY OF SUCH DAMAGE.
*********************************************************************/

#include <ros/ros.h>
#include <nodelet/loader.h>

int main(int argc, char **argv)
{
    ros::init(argc, argv, "equalize_histogram", ros::init_options::AnonymousName);
    if (ros::names::remap("image") == "image") {
        ROS_WARN("Topic 'image' has not been remapped! Typical command-line usage:\n"
                 "\t$ rosrun image_rotate image_rotate image:=<image topic> [transport]");
    }

    // need to use 1 worker thread to prevent freezing in imshow, calling imshow from mutiple threads
    //nodelet::Loader manager(false);
    ros::param::set("~num_worker_threads", 1); // need to call   Loader(bool provide_ros_api = true);
    nodelet::Loader manager(true);
    nodelet::M_string remappings;
    nodelet::V_string my_argv(argv + 1, argv + argc);
    my_argv.push_back("--shutdown-on-close"); // Internal

    manager.load(ros::this_node::getName(), "opencv_apps/equalize_histogram", remappings, my_argv);

    ros::spin();
    return 0;
}
