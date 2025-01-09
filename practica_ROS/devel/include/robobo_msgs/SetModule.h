// Generated by gencpp from file robobo_msgs/SetModule.msg
// DO NOT EDIT!


#ifndef ROBOBO_MSGS_MESSAGE_SETMODULE_H
#define ROBOBO_MSGS_MESSAGE_SETMODULE_H

#include <ros/service_traits.h>


#include <robobo_msgs/SetModuleRequest.h>
#include <robobo_msgs/SetModuleResponse.h>


namespace robobo_msgs
{

struct SetModule
{

typedef SetModuleRequest Request;
typedef SetModuleResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct SetModule
} // namespace robobo_msgs


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::robobo_msgs::SetModule > {
  static const char* value()
  {
    return "d1ff912db9829e756961c386739c3bd2";
  }

  static const char* value(const ::robobo_msgs::SetModule&) { return value(); }
};

template<>
struct DataType< ::robobo_msgs::SetModule > {
  static const char* value()
  {
    return "robobo_msgs/SetModule";
  }

  static const char* value(const ::robobo_msgs::SetModule&) { return value(); }
};


// service_traits::MD5Sum< ::robobo_msgs::SetModuleRequest> should match
// service_traits::MD5Sum< ::robobo_msgs::SetModule >
template<>
struct MD5Sum< ::robobo_msgs::SetModuleRequest>
{
  static const char* value()
  {
    return MD5Sum< ::robobo_msgs::SetModule >::value();
  }
  static const char* value(const ::robobo_msgs::SetModuleRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::robobo_msgs::SetModuleRequest> should match
// service_traits::DataType< ::robobo_msgs::SetModule >
template<>
struct DataType< ::robobo_msgs::SetModuleRequest>
{
  static const char* value()
  {
    return DataType< ::robobo_msgs::SetModule >::value();
  }
  static const char* value(const ::robobo_msgs::SetModuleRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::robobo_msgs::SetModuleResponse> should match
// service_traits::MD5Sum< ::robobo_msgs::SetModule >
template<>
struct MD5Sum< ::robobo_msgs::SetModuleResponse>
{
  static const char* value()
  {
    return MD5Sum< ::robobo_msgs::SetModule >::value();
  }
  static const char* value(const ::robobo_msgs::SetModuleResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::robobo_msgs::SetModuleResponse> should match
// service_traits::DataType< ::robobo_msgs::SetModule >
template<>
struct DataType< ::robobo_msgs::SetModuleResponse>
{
  static const char* value()
  {
    return DataType< ::robobo_msgs::SetModule >::value();
  }
  static const char* value(const ::robobo_msgs::SetModuleResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // ROBOBO_MSGS_MESSAGE_SETMODULE_H
