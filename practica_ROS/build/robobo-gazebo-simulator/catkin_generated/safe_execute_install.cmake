execute_process(COMMAND "/home/vboxuser/practica_ws/build/robobo-gazebo-simulator/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/vboxuser/practica_ws/build/robobo-gazebo-simulator/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
