// Generated by gencpp from file robobo_msgs/TalkCommand.msg
// DO NOT EDIT!


#ifndef ROBOBO_MSGS_MESSAGE_TALKCOMMAND_H
#define ROBOBO_MSGS_MESSAGE_TALKCOMMAND_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/String.h>

namespace robobo_msgs
{
template <class ContainerAllocator>
struct TalkCommand_
{
  typedef TalkCommand_<ContainerAllocator> Type;

  TalkCommand_()
    : text()  {
    }
  TalkCommand_(const ContainerAllocator& _alloc)
    : text(_alloc)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::String_<ContainerAllocator>  _text_type;
  _text_type text;





  typedef boost::shared_ptr< ::robobo_msgs::TalkCommand_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::robobo_msgs::TalkCommand_<ContainerAllocator> const> ConstPtr;

}; // struct TalkCommand_

typedef ::robobo_msgs::TalkCommand_<std::allocator<void> > TalkCommand;

typedef boost::shared_ptr< ::robobo_msgs::TalkCommand > TalkCommandPtr;
typedef boost::shared_ptr< ::robobo_msgs::TalkCommand const> TalkCommandConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::robobo_msgs::TalkCommand_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::robobo_msgs::TalkCommand_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::robobo_msgs::TalkCommand_<ContainerAllocator1> & lhs, const ::robobo_msgs::TalkCommand_<ContainerAllocator2> & rhs)
{
  return lhs.text == rhs.text;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::robobo_msgs::TalkCommand_<ContainerAllocator1> & lhs, const ::robobo_msgs::TalkCommand_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace robobo_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::robobo_msgs::TalkCommand_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::robobo_msgs::TalkCommand_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::robobo_msgs::TalkCommand_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::robobo_msgs::TalkCommand_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::robobo_msgs::TalkCommand_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::robobo_msgs::TalkCommand_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::robobo_msgs::TalkCommand_<ContainerAllocator> >
{
  static const char* value()
  {
    return "7fb91077b93c329c9eeaea1c488c03e0";
  }

  static const char* value(const ::robobo_msgs::TalkCommand_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x7fb91077b93c329cULL;
  static const uint64_t static_value2 = 0x9eeaea1c488c03e0ULL;
};

template<class ContainerAllocator>
struct DataType< ::robobo_msgs::TalkCommand_<ContainerAllocator> >
{
  static const char* value()
  {
    return "robobo_msgs/TalkCommand";
  }

  static const char* value(const ::robobo_msgs::TalkCommand_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::robobo_msgs::TalkCommand_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# Commands the robot to talk usin Text-To-Speech\n"
"#\n"
"# Text to be spoken\n"
"std_msgs/String text\n"
"\n"
"\n"
"================================================================================\n"
"MSG: std_msgs/String\n"
"string data\n"
;
  }

  static const char* value(const ::robobo_msgs::TalkCommand_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::robobo_msgs::TalkCommand_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.text);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct TalkCommand_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::robobo_msgs::TalkCommand_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::robobo_msgs::TalkCommand_<ContainerAllocator>& v)
  {
    s << indent << "text: ";
    s << std::endl;
    Printer< ::std_msgs::String_<ContainerAllocator> >::stream(s, indent + "  ", v.text);
  }
};

} // namespace message_operations
} // namespace ros

#endif // ROBOBO_MSGS_MESSAGE_TALKCOMMAND_H
