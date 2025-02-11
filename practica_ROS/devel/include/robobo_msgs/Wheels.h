// Generated by gencpp from file robobo_msgs/Wheels.msg
// DO NOT EDIT!


#ifndef ROBOBO_MSGS_MESSAGE_WHEELS_H
#define ROBOBO_MSGS_MESSAGE_WHEELS_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Int64.h>
#include <std_msgs/Int64.h>
#include <std_msgs/Int64.h>
#include <std_msgs/Int64.h>

namespace robobo_msgs
{
template <class ContainerAllocator>
struct Wheels_
{
  typedef Wheels_<ContainerAllocator> Type;

  Wheels_()
    : wheelPosR()
    , wheelPosL()
    , wheelSpeedR()
    , wheelSpeedL()  {
    }
  Wheels_(const ContainerAllocator& _alloc)
    : wheelPosR(_alloc)
    , wheelPosL(_alloc)
    , wheelSpeedR(_alloc)
    , wheelSpeedL(_alloc)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::Int64_<ContainerAllocator>  _wheelPosR_type;
  _wheelPosR_type wheelPosR;

   typedef  ::std_msgs::Int64_<ContainerAllocator>  _wheelPosL_type;
  _wheelPosL_type wheelPosL;

   typedef  ::std_msgs::Int64_<ContainerAllocator>  _wheelSpeedR_type;
  _wheelSpeedR_type wheelSpeedR;

   typedef  ::std_msgs::Int64_<ContainerAllocator>  _wheelSpeedL_type;
  _wheelSpeedL_type wheelSpeedL;





  typedef boost::shared_ptr< ::robobo_msgs::Wheels_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::robobo_msgs::Wheels_<ContainerAllocator> const> ConstPtr;

}; // struct Wheels_

typedef ::robobo_msgs::Wheels_<std::allocator<void> > Wheels;

typedef boost::shared_ptr< ::robobo_msgs::Wheels > WheelsPtr;
typedef boost::shared_ptr< ::robobo_msgs::Wheels const> WheelsConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::robobo_msgs::Wheels_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::robobo_msgs::Wheels_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::robobo_msgs::Wheels_<ContainerAllocator1> & lhs, const ::robobo_msgs::Wheels_<ContainerAllocator2> & rhs)
{
  return lhs.wheelPosR == rhs.wheelPosR &&
    lhs.wheelPosL == rhs.wheelPosL &&
    lhs.wheelSpeedR == rhs.wheelSpeedR &&
    lhs.wheelSpeedL == rhs.wheelSpeedL;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::robobo_msgs::Wheels_<ContainerAllocator1> & lhs, const ::robobo_msgs::Wheels_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace robobo_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::robobo_msgs::Wheels_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::robobo_msgs::Wheels_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::robobo_msgs::Wheels_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::robobo_msgs::Wheels_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::robobo_msgs::Wheels_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::robobo_msgs::Wheels_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::robobo_msgs::Wheels_<ContainerAllocator> >
{
  static const char* value()
  {
    return "e3007c5c2ec7faa3f8f71bd3a0d670c5";
  }

  static const char* value(const ::robobo_msgs::Wheels_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xe3007c5c2ec7faa3ULL;
  static const uint64_t static_value2 = 0xf8f71bd3a0d670c5ULL;
};

template<class ContainerAllocator>
struct DataType< ::robobo_msgs::Wheels_<ContainerAllocator> >
{
  static const char* value()
  {
    return "robobo_msgs/Wheels";
  }

  static const char* value(const ::robobo_msgs::Wheels_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::robobo_msgs::Wheels_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# Represents a change on the Rob base wheels\n"
"#\n"
"# Position (encoder) of the right wheel\n"
"std_msgs/Int64 wheelPosR\n"
"# Position (encoder) of the left wheel\n"
"std_msgs/Int64 wheelPosL\n"
"# Current right wheel speed\n"
"std_msgs/Int64 wheelSpeedR\n"
"# Current left wheel speed\n"
"std_msgs/Int64 wheelSpeedL\n"
"\n"
"================================================================================\n"
"MSG: std_msgs/Int64\n"
"int64 data\n"
;
  }

  static const char* value(const ::robobo_msgs::Wheels_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::robobo_msgs::Wheels_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.wheelPosR);
      stream.next(m.wheelPosL);
      stream.next(m.wheelSpeedR);
      stream.next(m.wheelSpeedL);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct Wheels_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::robobo_msgs::Wheels_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::robobo_msgs::Wheels_<ContainerAllocator>& v)
  {
    s << indent << "wheelPosR: ";
    s << std::endl;
    Printer< ::std_msgs::Int64_<ContainerAllocator> >::stream(s, indent + "  ", v.wheelPosR);
    s << indent << "wheelPosL: ";
    s << std::endl;
    Printer< ::std_msgs::Int64_<ContainerAllocator> >::stream(s, indent + "  ", v.wheelPosL);
    s << indent << "wheelSpeedR: ";
    s << std::endl;
    Printer< ::std_msgs::Int64_<ContainerAllocator> >::stream(s, indent + "  ", v.wheelSpeedR);
    s << indent << "wheelSpeedL: ";
    s << std::endl;
    Printer< ::std_msgs::Int64_<ContainerAllocator> >::stream(s, indent + "  ", v.wheelSpeedL);
  }
};

} // namespace message_operations
} // namespace ros

#endif // ROBOBO_MSGS_MESSAGE_WHEELS_H
