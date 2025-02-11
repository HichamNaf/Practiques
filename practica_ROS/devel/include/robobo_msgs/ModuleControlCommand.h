// Generated by gencpp from file robobo_msgs/ModuleControlCommand.msg
// DO NOT EDIT!


#ifndef ROBOBO_MSGS_MESSAGE_MODULECONTROLCOMMAND_H
#define ROBOBO_MSGS_MESSAGE_MODULECONTROLCOMMAND_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace robobo_msgs
{
template <class ContainerAllocator>
struct ModuleControlCommand_
{
  typedef ModuleControlCommand_<ContainerAllocator> Type;

  ModuleControlCommand_()
    : module_name()
    , on(false)  {
    }
  ModuleControlCommand_(const ContainerAllocator& _alloc)
    : module_name(_alloc)
    , on(false)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>> _module_name_type;
  _module_name_type module_name;

   typedef uint8_t _on_type;
  _on_type on;





  typedef boost::shared_ptr< ::robobo_msgs::ModuleControlCommand_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::robobo_msgs::ModuleControlCommand_<ContainerAllocator> const> ConstPtr;

}; // struct ModuleControlCommand_

typedef ::robobo_msgs::ModuleControlCommand_<std::allocator<void> > ModuleControlCommand;

typedef boost::shared_ptr< ::robobo_msgs::ModuleControlCommand > ModuleControlCommandPtr;
typedef boost::shared_ptr< ::robobo_msgs::ModuleControlCommand const> ModuleControlCommandConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::robobo_msgs::ModuleControlCommand_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::robobo_msgs::ModuleControlCommand_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::robobo_msgs::ModuleControlCommand_<ContainerAllocator1> & lhs, const ::robobo_msgs::ModuleControlCommand_<ContainerAllocator2> & rhs)
{
  return lhs.module_name == rhs.module_name &&
    lhs.on == rhs.on;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::robobo_msgs::ModuleControlCommand_<ContainerAllocator1> & lhs, const ::robobo_msgs::ModuleControlCommand_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace robobo_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::robobo_msgs::ModuleControlCommand_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::robobo_msgs::ModuleControlCommand_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::robobo_msgs::ModuleControlCommand_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::robobo_msgs::ModuleControlCommand_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::robobo_msgs::ModuleControlCommand_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::robobo_msgs::ModuleControlCommand_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::robobo_msgs::ModuleControlCommand_<ContainerAllocator> >
{
  static const char* value()
  {
    return "e6a9b409247a54586771369e8f259611";
  }

  static const char* value(const ::robobo_msgs::ModuleControlCommand_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xe6a9b409247a5458ULL;
  static const uint64_t static_value2 = 0x6771369e8f259611ULL;
};

template<class ContainerAllocator>
struct DataType< ::robobo_msgs::ModuleControlCommand_<ContainerAllocator> >
{
  static const char* value()
  {
    return "robobo_msgs/ModuleControlCommand";
  }

  static const char* value(const ::robobo_msgs::ModuleControlCommand_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::robobo_msgs::ModuleControlCommand_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# Commands the robot to turn on or off a module\n"
"#\n"
"# Name of the module\n"
"string module_name\n"
"# A bool to represent if the module should be turned\n"
"# on or off (true for on and false for off)\n"
"bool on\n"
;
  }

  static const char* value(const ::robobo_msgs::ModuleControlCommand_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::robobo_msgs::ModuleControlCommand_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.module_name);
      stream.next(m.on);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct ModuleControlCommand_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::robobo_msgs::ModuleControlCommand_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::robobo_msgs::ModuleControlCommand_<ContainerAllocator>& v)
  {
    s << indent << "module_name: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>::stream(s, indent + "  ", v.module_name);
    s << indent << "on: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.on);
  }
};

} // namespace message_operations
} // namespace ros

#endif // ROBOBO_MSGS_MESSAGE_MODULECONTROLCOMMAND_H
