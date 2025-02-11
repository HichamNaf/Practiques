// Generated by gencpp from file robobo_msgs/MoveWheelsRequest.msg
// DO NOT EDIT!


#ifndef ROBOBO_MSGS_MESSAGE_MOVEWHEELSREQUEST_H
#define ROBOBO_MSGS_MESSAGE_MOVEWHEELSREQUEST_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Int8.h>
#include <std_msgs/Int8.h>
#include <std_msgs/Int32.h>
#include <std_msgs/Int16.h>

namespace robobo_msgs
{
template <class ContainerAllocator>
struct MoveWheelsRequest_
{
  typedef MoveWheelsRequest_<ContainerAllocator> Type;

  MoveWheelsRequest_()
    : lspeed()
    , rspeed()
    , time()
    , unlockid()  {
    }
  MoveWheelsRequest_(const ContainerAllocator& _alloc)
    : lspeed(_alloc)
    , rspeed(_alloc)
    , time(_alloc)
    , unlockid(_alloc)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::Int8_<ContainerAllocator>  _lspeed_type;
  _lspeed_type lspeed;

   typedef  ::std_msgs::Int8_<ContainerAllocator>  _rspeed_type;
  _rspeed_type rspeed;

   typedef  ::std_msgs::Int32_<ContainerAllocator>  _time_type;
  _time_type time;

   typedef  ::std_msgs::Int16_<ContainerAllocator>  _unlockid_type;
  _unlockid_type unlockid;





  typedef boost::shared_ptr< ::robobo_msgs::MoveWheelsRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::robobo_msgs::MoveWheelsRequest_<ContainerAllocator> const> ConstPtr;

}; // struct MoveWheelsRequest_

typedef ::robobo_msgs::MoveWheelsRequest_<std::allocator<void> > MoveWheelsRequest;

typedef boost::shared_ptr< ::robobo_msgs::MoveWheelsRequest > MoveWheelsRequestPtr;
typedef boost::shared_ptr< ::robobo_msgs::MoveWheelsRequest const> MoveWheelsRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::robobo_msgs::MoveWheelsRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::robobo_msgs::MoveWheelsRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::robobo_msgs::MoveWheelsRequest_<ContainerAllocator1> & lhs, const ::robobo_msgs::MoveWheelsRequest_<ContainerAllocator2> & rhs)
{
  return lhs.lspeed == rhs.lspeed &&
    lhs.rspeed == rhs.rspeed &&
    lhs.time == rhs.time &&
    lhs.unlockid == rhs.unlockid;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::robobo_msgs::MoveWheelsRequest_<ContainerAllocator1> & lhs, const ::robobo_msgs::MoveWheelsRequest_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace robobo_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::robobo_msgs::MoveWheelsRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::robobo_msgs::MoveWheelsRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::robobo_msgs::MoveWheelsRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::robobo_msgs::MoveWheelsRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::robobo_msgs::MoveWheelsRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::robobo_msgs::MoveWheelsRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::robobo_msgs::MoveWheelsRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "e266bff9487ab0f7db9d11321bda62d1";
  }

  static const char* value(const ::robobo_msgs::MoveWheelsRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xe266bff9487ab0f7ULL;
  static const uint64_t static_value2 = 0xdb9d11321bda62d1ULL;
};

template<class ContainerAllocator>
struct DataType< ::robobo_msgs::MoveWheelsRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "robobo_msgs/MoveWheelsRequest";
  }

  static const char* value(const ::robobo_msgs::MoveWheelsRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::robobo_msgs::MoveWheelsRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# Commands the robot to move the wheels for\n"
"# an specific time\n"
"#\n"
"# Left wheel speed\n"
"std_msgs/Int8 lspeed\n"
"# Right wheel speed\n"
"std_msgs/Int8 rspeed\n"
"# Time in miliseconds\n"
"std_msgs/Int32 time\n"
"# Identifier for end-of-movement notification\n"
"std_msgs/Int16 unlockid\n"
"\n"
"================================================================================\n"
"MSG: std_msgs/Int8\n"
"int8 data\n"
"\n"
"================================================================================\n"
"MSG: std_msgs/Int32\n"
"int32 data\n"
"================================================================================\n"
"MSG: std_msgs/Int16\n"
"int16 data\n"
;
  }

  static const char* value(const ::robobo_msgs::MoveWheelsRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::robobo_msgs::MoveWheelsRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.lspeed);
      stream.next(m.rspeed);
      stream.next(m.time);
      stream.next(m.unlockid);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct MoveWheelsRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::robobo_msgs::MoveWheelsRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::robobo_msgs::MoveWheelsRequest_<ContainerAllocator>& v)
  {
    s << indent << "lspeed: ";
    s << std::endl;
    Printer< ::std_msgs::Int8_<ContainerAllocator> >::stream(s, indent + "  ", v.lspeed);
    s << indent << "rspeed: ";
    s << std::endl;
    Printer< ::std_msgs::Int8_<ContainerAllocator> >::stream(s, indent + "  ", v.rspeed);
    s << indent << "time: ";
    s << std::endl;
    Printer< ::std_msgs::Int32_<ContainerAllocator> >::stream(s, indent + "  ", v.time);
    s << indent << "unlockid: ";
    s << std::endl;
    Printer< ::std_msgs::Int16_<ContainerAllocator> >::stream(s, indent + "  ", v.unlockid);
  }
};

} // namespace message_operations
} // namespace ros

#endif // ROBOBO_MSGS_MESSAGE_MOVEWHEELSREQUEST_H
