// Generated by gencpp from file robobo_msgs/SetLoad.msg
// DO NOT EDIT!


#ifndef ROBOBO_MSGS_MESSAGE_SETLOAD_H
#define ROBOBO_MSGS_MESSAGE_SETLOAD_H

#include <ros/service_traits.h>


#include <robobo_msgs/SetLoadRequest.h>
#include <robobo_msgs/SetLoadResponse.h>


namespace robobo_msgs
{

struct SetLoad
{

typedef SetLoadRequest Request;
typedef SetLoadResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct SetLoad
} // namespace robobo_msgs


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::robobo_msgs::SetLoad > {
  static const char* value()
  {
    return "c6df5f3c4e0e3e4f0d7fcf166cd717e7";
  }

  static const char* value(const ::robobo_msgs::SetLoad&) { return value(); }
};

template<>
struct DataType< ::robobo_msgs::SetLoad > {
  static const char* value()
  {
    return "robobo_msgs/SetLoad";
  }

  static const char* value(const ::robobo_msgs::SetLoad&) { return value(); }
};


// service_traits::MD5Sum< ::robobo_msgs::SetLoadRequest> should match
// service_traits::MD5Sum< ::robobo_msgs::SetLoad >
template<>
struct MD5Sum< ::robobo_msgs::SetLoadRequest>
{
  static const char* value()
  {
    return MD5Sum< ::robobo_msgs::SetLoad >::value();
  }
  static const char* value(const ::robobo_msgs::SetLoadRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::robobo_msgs::SetLoadRequest> should match
// service_traits::DataType< ::robobo_msgs::SetLoad >
template<>
struct DataType< ::robobo_msgs::SetLoadRequest>
{
  static const char* value()
  {
    return DataType< ::robobo_msgs::SetLoad >::value();
  }
  static const char* value(const ::robobo_msgs::SetLoadRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::robobo_msgs::SetLoadResponse> should match
// service_traits::MD5Sum< ::robobo_msgs::SetLoad >
template<>
struct MD5Sum< ::robobo_msgs::SetLoadResponse>
{
  static const char* value()
  {
    return MD5Sum< ::robobo_msgs::SetLoad >::value();
  }
  static const char* value(const ::robobo_msgs::SetLoadResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::robobo_msgs::SetLoadResponse> should match
// service_traits::DataType< ::robobo_msgs::SetLoad >
template<>
struct DataType< ::robobo_msgs::SetLoadResponse>
{
  static const char* value()
  {
    return DataType< ::robobo_msgs::SetLoad >::value();
  }
  static const char* value(const ::robobo_msgs::SetLoadResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // ROBOBO_MSGS_MESSAGE_SETLOAD_H
