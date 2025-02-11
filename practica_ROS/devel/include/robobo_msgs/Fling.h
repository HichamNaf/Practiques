// Generated by gencpp from file robobo_msgs/Fling.msg
// DO NOT EDIT!


#ifndef ROBOBO_MSGS_MESSAGE_FLING_H
#define ROBOBO_MSGS_MESSAGE_FLING_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Int16.h>
#include <std_msgs/Int32.h>
#include <std_msgs/Int16.h>

namespace robobo_msgs
{
template <class ContainerAllocator>
struct Fling_
{
  typedef Fling_<ContainerAllocator> Type;

  Fling_()
    : angle()
    , time()
    , distance()  {
    }
  Fling_(const ContainerAllocator& _alloc)
    : angle(_alloc)
    , time(_alloc)
    , distance(_alloc)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::Int16_<ContainerAllocator>  _angle_type;
  _angle_type angle;

   typedef  ::std_msgs::Int32_<ContainerAllocator>  _time_type;
  _time_type time;

   typedef  ::std_msgs::Int16_<ContainerAllocator>  _distance_type;
  _distance_type distance;





  typedef boost::shared_ptr< ::robobo_msgs::Fling_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::robobo_msgs::Fling_<ContainerAllocator> const> ConstPtr;

}; // struct Fling_

typedef ::robobo_msgs::Fling_<std::allocator<void> > Fling;

typedef boost::shared_ptr< ::robobo_msgs::Fling > FlingPtr;
typedef boost::shared_ptr< ::robobo_msgs::Fling const> FlingConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::robobo_msgs::Fling_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::robobo_msgs::Fling_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::robobo_msgs::Fling_<ContainerAllocator1> & lhs, const ::robobo_msgs::Fling_<ContainerAllocator2> & rhs)
{
  return lhs.angle == rhs.angle &&
    lhs.time == rhs.time &&
    lhs.distance == rhs.distance;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::robobo_msgs::Fling_<ContainerAllocator1> & lhs, const ::robobo_msgs::Fling_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace robobo_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::robobo_msgs::Fling_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::robobo_msgs::Fling_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::robobo_msgs::Fling_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::robobo_msgs::Fling_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::robobo_msgs::Fling_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::robobo_msgs::Fling_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::robobo_msgs::Fling_<ContainerAllocator> >
{
  static const char* value()
  {
    return "223606e2db34b4f54252a5c13a50f185";
  }

  static const char* value(const ::robobo_msgs::Fling_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x223606e2db34b4f5ULL;
  static const uint64_t static_value2 = 0x4252a5c13a50f185ULL;
};

template<class ContainerAllocator>
struct DataType< ::robobo_msgs::Fling_<ContainerAllocator> >
{
  static const char* value()
  {
    return "robobo_msgs/Fling";
  }

  static const char* value(const ::robobo_msgs::Fling_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::robobo_msgs::Fling_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# Message used to represent a gross gesture on the screen\n"
"#\n"
"# Angle in radiants of the fling gesture\n"
"std_msgs/Int16 angle\n"
"# Time in milliseconds between the start and the end\n"
"# of the gesture\n"
"std_msgs/Int32 time\n"
"# Distance between the beginning coordinate and \n"
"# the ending coordinate\n"
"std_msgs/Int16 distance\n"
"\n"
"================================================================================\n"
"MSG: std_msgs/Int16\n"
"int16 data\n"
"\n"
"================================================================================\n"
"MSG: std_msgs/Int32\n"
"int32 data\n"
;
  }

  static const char* value(const ::robobo_msgs::Fling_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::robobo_msgs::Fling_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.angle);
      stream.next(m.time);
      stream.next(m.distance);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct Fling_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::robobo_msgs::Fling_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::robobo_msgs::Fling_<ContainerAllocator>& v)
  {
    s << indent << "angle: ";
    s << std::endl;
    Printer< ::std_msgs::Int16_<ContainerAllocator> >::stream(s, indent + "  ", v.angle);
    s << indent << "time: ";
    s << std::endl;
    Printer< ::std_msgs::Int32_<ContainerAllocator> >::stream(s, indent + "  ", v.time);
    s << indent << "distance: ";
    s << std::endl;
    Printer< ::std_msgs::Int16_<ContainerAllocator> >::stream(s, indent + "  ", v.distance);
  }
};

} // namespace message_operations
} // namespace ros

#endif // ROBOBO_MSGS_MESSAGE_FLING_H
