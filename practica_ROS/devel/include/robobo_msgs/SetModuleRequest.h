// Generated by gencpp from file robobo_msgs/SetModuleRequest.msg
// DO NOT EDIT!


#ifndef ROBOBO_MSGS_MESSAGE_SETMODULEREQUEST_H
#define ROBOBO_MSGS_MESSAGE_SETMODULEREQUEST_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/String.h>
#include <std_msgs/Bool.h>

namespace robobo_msgs
{
template <class ContainerAllocator>
struct SetModuleRequest_
{
  typedef SetModuleRequest_<ContainerAllocator> Type;

  SetModuleRequest_()
    : moduleName()
    , moduleState()  {
    }
  SetModuleRequest_(const ContainerAllocator& _alloc)
    : moduleName(_alloc)
    , moduleState(_alloc)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::String_<ContainerAllocator>  _moduleName_type;
  _moduleName_type moduleName;

   typedef  ::std_msgs::Bool_<ContainerAllocator>  _moduleState_type;
  _moduleState_type moduleState;





  typedef boost::shared_ptr< ::robobo_msgs::SetModuleRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::robobo_msgs::SetModuleRequest_<ContainerAllocator> const> ConstPtr;

}; // struct SetModuleRequest_

typedef ::robobo_msgs::SetModuleRequest_<std::allocator<void> > SetModuleRequest;

typedef boost::shared_ptr< ::robobo_msgs::SetModuleRequest > SetModuleRequestPtr;
typedef boost::shared_ptr< ::robobo_msgs::SetModuleRequest const> SetModuleRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::robobo_msgs::SetModuleRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::robobo_msgs::SetModuleRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::robobo_msgs::SetModuleRequest_<ContainerAllocator1> & lhs, const ::robobo_msgs::SetModuleRequest_<ContainerAllocator2> & rhs)
{
  return lhs.moduleName == rhs.moduleName &&
    lhs.moduleState == rhs.moduleState;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::robobo_msgs::SetModuleRequest_<ContainerAllocator1> & lhs, const ::robobo_msgs::SetModuleRequest_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace robobo_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::robobo_msgs::SetModuleRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::robobo_msgs::SetModuleRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::robobo_msgs::SetModuleRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::robobo_msgs::SetModuleRequest_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::robobo_msgs::SetModuleRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::robobo_msgs::SetModuleRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::robobo_msgs::SetModuleRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "5983e1be243acc0d1b2471a384feece7";
  }

  static const char* value(const ::robobo_msgs::SetModuleRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x5983e1be243acc0dULL;
  static const uint64_t static_value2 = 0x1b2471a384feece7ULL;
};

template<class ContainerAllocator>
struct DataType< ::robobo_msgs::SetModuleRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "robobo_msgs/SetModuleRequest";
  }

  static const char* value(const ::robobo_msgs::SetModuleRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::robobo_msgs::SetModuleRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# Commands the robot to start/stop a module\n"
"#\n"
"# Module name; posible values: tag, object-detection, lane-detection \n"
"# State: true on, false off\n"
"std_msgs/String moduleName\n"
"std_msgs/Bool moduleState\n"
"\n"
"================================================================================\n"
"MSG: std_msgs/String\n"
"string data\n"
"\n"
"================================================================================\n"
"MSG: std_msgs/Bool\n"
"bool data\n"
;
  }

  static const char* value(const ::robobo_msgs::SetModuleRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::robobo_msgs::SetModuleRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.moduleName);
      stream.next(m.moduleState);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct SetModuleRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::robobo_msgs::SetModuleRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::robobo_msgs::SetModuleRequest_<ContainerAllocator>& v)
  {
    s << indent << "moduleName: ";
    s << std::endl;
    Printer< ::std_msgs::String_<ContainerAllocator> >::stream(s, indent + "  ", v.moduleName);
    s << indent << "moduleState: ";
    s << std::endl;
    Printer< ::std_msgs::Bool_<ContainerAllocator> >::stream(s, indent + "  ", v.moduleState);
  }
};

} // namespace message_operations
} // namespace ros

#endif // ROBOBO_MSGS_MESSAGE_SETMODULEREQUEST_H
