// Generated by gencpp from file opencv_apps/FlowArray.msg
// DO NOT EDIT!


#ifndef OPENCV_APPS_MESSAGE_FLOWARRAY_H
#define OPENCV_APPS_MESSAGE_FLOWARRAY_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <opencv_apps/Flow.h>

namespace opencv_apps
{
template <class ContainerAllocator>
struct FlowArray_
{
  typedef FlowArray_<ContainerAllocator> Type;

  FlowArray_()
    : flow()  {
    }
  FlowArray_(const ContainerAllocator& _alloc)
    : flow(_alloc)  {
  (void)_alloc;
    }



   typedef std::vector< ::opencv_apps::Flow_<ContainerAllocator> , typename std::allocator_traits<ContainerAllocator>::template rebind_alloc< ::opencv_apps::Flow_<ContainerAllocator> >> _flow_type;
  _flow_type flow;





  typedef boost::shared_ptr< ::opencv_apps::FlowArray_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::opencv_apps::FlowArray_<ContainerAllocator> const> ConstPtr;

}; // struct FlowArray_

typedef ::opencv_apps::FlowArray_<std::allocator<void> > FlowArray;

typedef boost::shared_ptr< ::opencv_apps::FlowArray > FlowArrayPtr;
typedef boost::shared_ptr< ::opencv_apps::FlowArray const> FlowArrayConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::opencv_apps::FlowArray_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::opencv_apps::FlowArray_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::opencv_apps::FlowArray_<ContainerAllocator1> & lhs, const ::opencv_apps::FlowArray_<ContainerAllocator2> & rhs)
{
  return lhs.flow == rhs.flow;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::opencv_apps::FlowArray_<ContainerAllocator1> & lhs, const ::opencv_apps::FlowArray_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace opencv_apps

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::opencv_apps::FlowArray_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::opencv_apps::FlowArray_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::opencv_apps::FlowArray_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::opencv_apps::FlowArray_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::opencv_apps::FlowArray_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::opencv_apps::FlowArray_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::opencv_apps::FlowArray_<ContainerAllocator> >
{
  static const char* value()
  {
    return "fe292dca56eb3673cd698ea9ef841962";
  }

  static const char* value(const ::opencv_apps::FlowArray_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xfe292dca56eb3673ULL;
  static const uint64_t static_value2 = 0xcd698ea9ef841962ULL;
};

template<class ContainerAllocator>
struct DataType< ::opencv_apps::FlowArray_<ContainerAllocator> >
{
  static const char* value()
  {
    return "opencv_apps/FlowArray";
  }

  static const char* value(const ::opencv_apps::FlowArray_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::opencv_apps::FlowArray_<ContainerAllocator> >
{
  static const char* value()
  {
    return "Flow[] flow\n"
"\n"
"================================================================================\n"
"MSG: opencv_apps/Flow\n"
"Point2D point\n"
"Point2D velocity\n"
"\n"
"================================================================================\n"
"MSG: opencv_apps/Point2D\n"
"float64 x\n"
"float64 y\n"
"\n"
;
  }

  static const char* value(const ::opencv_apps::FlowArray_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::opencv_apps::FlowArray_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.flow);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct FlowArray_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::opencv_apps::FlowArray_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::opencv_apps::FlowArray_<ContainerAllocator>& v)
  {
    s << indent << "flow[]" << std::endl;
    for (size_t i = 0; i < v.flow.size(); ++i)
    {
      s << indent << "  flow[" << i << "]: ";
      s << std::endl;
      s << indent;
      Printer< ::opencv_apps::Flow_<ContainerAllocator> >::stream(s, indent + "    ", v.flow[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // OPENCV_APPS_MESSAGE_FLOWARRAY_H
