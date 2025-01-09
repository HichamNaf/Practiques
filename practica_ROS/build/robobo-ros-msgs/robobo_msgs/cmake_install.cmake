# Install script for directory: /home/vboxuser/practica_ws/src/robobo-ros-msgs/robobo_msgs

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/vboxuser/practica_ws/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/robobo_msgs/msg" TYPE FILE FILES
    "/home/vboxuser/practica_ws/src/robobo-ros-msgs/robobo_msgs/msg/Wheels.msg"
    "/home/vboxuser/practica_ws/src/robobo-ros-msgs/robobo_msgs/msg/IRs.msg"
    "/home/vboxuser/practica_ws/src/robobo-ros-msgs/robobo_msgs/msg/Tap.msg"
    "/home/vboxuser/practica_ws/src/robobo-ros-msgs/robobo_msgs/msg/Fling.msg"
    "/home/vboxuser/practica_ws/src/robobo-ros-msgs/robobo_msgs/msg/Led.msg"
    "/home/vboxuser/practica_ws/src/robobo-ros-msgs/robobo_msgs/msg/Blob.msg"
    "/home/vboxuser/practica_ws/src/robobo-ros-msgs/robobo_msgs/msg/QrCode.msg"
    "/home/vboxuser/practica_ws/src/robobo-ros-msgs/robobo_msgs/msg/QrCodeChange.msg"
    "/home/vboxuser/practica_ws/src/robobo-ros-msgs/robobo_msgs/msg/Lane.msg"
    "/home/vboxuser/practica_ws/src/robobo-ros-msgs/robobo_msgs/msg/ModuleControlCommand.msg"
    "/home/vboxuser/practica_ws/src/robobo-ros-msgs/robobo_msgs/msg/MovePanTiltCommand.msg"
    "/home/vboxuser/practica_ws/src/robobo-ros-msgs/robobo_msgs/msg/MoveWheelsCommand.msg"
    "/home/vboxuser/practica_ws/src/robobo-ros-msgs/robobo_msgs/msg/PlaySoundCommand.msg"
    "/home/vboxuser/practica_ws/src/robobo-ros-msgs/robobo_msgs/msg/SetCameraCommand.msg"
    "/home/vboxuser/practica_ws/src/robobo-ros-msgs/robobo_msgs/msg/SetEmotionCommand.msg"
    "/home/vboxuser/practica_ws/src/robobo-ros-msgs/robobo_msgs/msg/SetLedCommand.msg"
    "/home/vboxuser/practica_ws/src/robobo-ros-msgs/robobo_msgs/msg/SetBlobCommand.msg"
    "/home/vboxuser/practica_ws/src/robobo-ros-msgs/robobo_msgs/msg/SetSensorFrequencyCommand.msg"
    "/home/vboxuser/practica_ws/src/robobo-ros-msgs/robobo_msgs/msg/TalkCommand.msg"
    "/home/vboxuser/practica_ws/src/robobo-ros-msgs/robobo_msgs/msg/ResetWheelsCommand.msg"
    "/home/vboxuser/practica_ws/src/robobo-ros-msgs/robobo_msgs/msg/OrientationEuler.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/robobo_msgs/srv" TYPE FILE FILES
    "/home/vboxuser/practica_ws/src/robobo-ros-msgs/robobo_msgs/srv/MovePanTilt.srv"
    "/home/vboxuser/practica_ws/src/robobo-ros-msgs/robobo_msgs/srv/MoveWheels.srv"
    "/home/vboxuser/practica_ws/src/robobo-ros-msgs/robobo_msgs/srv/PlaySound.srv"
    "/home/vboxuser/practica_ws/src/robobo-ros-msgs/robobo_msgs/srv/ResetWheels.srv"
    "/home/vboxuser/practica_ws/src/robobo-ros-msgs/robobo_msgs/srv/SetCamera.srv"
    "/home/vboxuser/practica_ws/src/robobo-ros-msgs/robobo_msgs/srv/SetEmotion.srv"
    "/home/vboxuser/practica_ws/src/robobo-ros-msgs/robobo_msgs/srv/SetLed.srv"
    "/home/vboxuser/practica_ws/src/robobo-ros-msgs/robobo_msgs/srv/SetSensorFrequency.srv"
    "/home/vboxuser/practica_ws/src/robobo-ros-msgs/robobo_msgs/srv/Talk.srv"
    "/home/vboxuser/practica_ws/src/robobo-ros-msgs/robobo_msgs/srv/SetLoad.srv"
    "/home/vboxuser/practica_ws/src/robobo-ros-msgs/robobo_msgs/srv/SetModule.srv"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/robobo_msgs/cmake" TYPE FILE FILES "/home/vboxuser/practica_ws/build/robobo-ros-msgs/robobo_msgs/catkin_generated/installspace/robobo_msgs-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/vboxuser/practica_ws/devel/include/robobo_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/vboxuser/practica_ws/devel/share/roseus/ros/robobo_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/vboxuser/practica_ws/devel/share/common-lisp/ros/robobo_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/vboxuser/practica_ws/devel/share/gennodejs/ros/robobo_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python3" -m compileall "/home/vboxuser/practica_ws/devel/lib/python3/dist-packages/robobo_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages" TYPE DIRECTORY FILES "/home/vboxuser/practica_ws/devel/lib/python3/dist-packages/robobo_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/vboxuser/practica_ws/build/robobo-ros-msgs/robobo_msgs/catkin_generated/installspace/robobo_msgs.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/robobo_msgs/cmake" TYPE FILE FILES "/home/vboxuser/practica_ws/build/robobo-ros-msgs/robobo_msgs/catkin_generated/installspace/robobo_msgs-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/robobo_msgs/cmake" TYPE FILE FILES
    "/home/vboxuser/practica_ws/build/robobo-ros-msgs/robobo_msgs/catkin_generated/installspace/robobo_msgsConfig.cmake"
    "/home/vboxuser/practica_ws/build/robobo-ros-msgs/robobo_msgs/catkin_generated/installspace/robobo_msgsConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/robobo_msgs" TYPE FILE FILES "/home/vboxuser/practica_ws/src/robobo-ros-msgs/robobo_msgs/package.xml")
endif()

