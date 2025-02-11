// Generated by gencpp from file robobo_msgs/SetEmotion.msg
// DO NOT EDIT!


#ifndef ROBOBO_MSGS_MESSAGE_SETEMOTION_H
#define ROBOBO_MSGS_MESSAGE_SETEMOTION_H

#include <ros/service_traits.h>


#include <robobo_msgs/SetEmotionRequest.h>
#include <robobo_msgs/SetEmotionResponse.h>


namespace robobo_msgs
{

struct SetEmotion
{

typedef SetEmotionRequest Request;
typedef SetEmotionResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct SetEmotion
} // namespace robobo_msgs


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::robobo_msgs::SetEmotion > {
  static const char* value()
  {
    return "b56a22e94c3e6cd89d04a799670be723";
  }

  static const char* value(const ::robobo_msgs::SetEmotion&) { return value(); }
};

template<>
struct DataType< ::robobo_msgs::SetEmotion > {
  static const char* value()
  {
    return "robobo_msgs/SetEmotion";
  }

  static const char* value(const ::robobo_msgs::SetEmotion&) { return value(); }
};


// service_traits::MD5Sum< ::robobo_msgs::SetEmotionRequest> should match
// service_traits::MD5Sum< ::robobo_msgs::SetEmotion >
template<>
struct MD5Sum< ::robobo_msgs::SetEmotionRequest>
{
  static const char* value()
  {
    return MD5Sum< ::robobo_msgs::SetEmotion >::value();
  }
  static const char* value(const ::robobo_msgs::SetEmotionRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::robobo_msgs::SetEmotionRequest> should match
// service_traits::DataType< ::robobo_msgs::SetEmotion >
template<>
struct DataType< ::robobo_msgs::SetEmotionRequest>
{
  static const char* value()
  {
    return DataType< ::robobo_msgs::SetEmotion >::value();
  }
  static const char* value(const ::robobo_msgs::SetEmotionRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::robobo_msgs::SetEmotionResponse> should match
// service_traits::MD5Sum< ::robobo_msgs::SetEmotion >
template<>
struct MD5Sum< ::robobo_msgs::SetEmotionResponse>
{
  static const char* value()
  {
    return MD5Sum< ::robobo_msgs::SetEmotion >::value();
  }
  static const char* value(const ::robobo_msgs::SetEmotionResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::robobo_msgs::SetEmotionResponse> should match
// service_traits::DataType< ::robobo_msgs::SetEmotion >
template<>
struct DataType< ::robobo_msgs::SetEmotionResponse>
{
  static const char* value()
  {
    return DataType< ::robobo_msgs::SetEmotion >::value();
  }
  static const char* value(const ::robobo_msgs::SetEmotionResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // ROBOBO_MSGS_MESSAGE_SETEMOTION_H
