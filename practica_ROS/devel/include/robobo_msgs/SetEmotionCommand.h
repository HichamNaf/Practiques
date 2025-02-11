// Generated by gencpp from file robobo_msgs/SetEmotionCommand.msg
// DO NOT EDIT!


#ifndef ROBOBO_MSGS_MESSAGE_SETEMOTIONCOMMAND_H
#define ROBOBO_MSGS_MESSAGE_SETEMOTIONCOMMAND_H


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
struct SetEmotionCommand_
{
  typedef SetEmotionCommand_<ContainerAllocator> Type;

  SetEmotionCommand_()
    : emotion()  {
    }
  SetEmotionCommand_(const ContainerAllocator& _alloc)
    : emotion(_alloc)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::String_<ContainerAllocator>  _emotion_type;
  _emotion_type emotion;





  typedef boost::shared_ptr< ::robobo_msgs::SetEmotionCommand_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::robobo_msgs::SetEmotionCommand_<ContainerAllocator> const> ConstPtr;

}; // struct SetEmotionCommand_

typedef ::robobo_msgs::SetEmotionCommand_<std::allocator<void> > SetEmotionCommand;

typedef boost::shared_ptr< ::robobo_msgs::SetEmotionCommand > SetEmotionCommandPtr;
typedef boost::shared_ptr< ::robobo_msgs::SetEmotionCommand const> SetEmotionCommandConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::robobo_msgs::SetEmotionCommand_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::robobo_msgs::SetEmotionCommand_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::robobo_msgs::SetEmotionCommand_<ContainerAllocator1> & lhs, const ::robobo_msgs::SetEmotionCommand_<ContainerAllocator2> & rhs)
{
  return lhs.emotion == rhs.emotion;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::robobo_msgs::SetEmotionCommand_<ContainerAllocator1> & lhs, const ::robobo_msgs::SetEmotionCommand_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace robobo_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::robobo_msgs::SetEmotionCommand_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::robobo_msgs::SetEmotionCommand_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::robobo_msgs::SetEmotionCommand_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::robobo_msgs::SetEmotionCommand_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::robobo_msgs::SetEmotionCommand_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::robobo_msgs::SetEmotionCommand_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::robobo_msgs::SetEmotionCommand_<ContainerAllocator> >
{
  static const char* value()
  {
    return "a6515dd33a2228f41cfa2f673f8eb2aa";
  }

  static const char* value(const ::robobo_msgs::SetEmotionCommand_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xa6515dd33a2228f4ULL;
  static const uint64_t static_value2 = 0x1cfa2f673f8eb2aaULL;
};

template<class ContainerAllocator>
struct DataType< ::robobo_msgs::SetEmotionCommand_<ContainerAllocator> >
{
  static const char* value()
  {
    return "robobo_msgs/SetEmotionCommand";
  }

  static const char* value(const ::robobo_msgs::SetEmotionCommand_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::robobo_msgs::SetEmotionCommand_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# Commands the robot to show an emotion in the display\n"
"#\n"
"# String of the emotion to show. Posible values:\n"
"# happy, laughing, sad, angry, surprised, normal.\n"
"std_msgs/String emotion\n"
"\n"
"================================================================================\n"
"MSG: std_msgs/String\n"
"string data\n"
;
  }

  static const char* value(const ::robobo_msgs::SetEmotionCommand_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::robobo_msgs::SetEmotionCommand_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.emotion);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct SetEmotionCommand_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::robobo_msgs::SetEmotionCommand_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::robobo_msgs::SetEmotionCommand_<ContainerAllocator>& v)
  {
    s << indent << "emotion: ";
    s << std::endl;
    Printer< ::std_msgs::String_<ContainerAllocator> >::stream(s, indent + "  ", v.emotion);
  }
};

} // namespace message_operations
} // namespace ros

#endif // ROBOBO_MSGS_MESSAGE_SETEMOTIONCOMMAND_H
