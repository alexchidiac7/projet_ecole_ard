// Generated by gencpp from file topic_tools/MuxSelectResponse.msg
// DO NOT EDIT!


#ifndef TOPIC_TOOLS_MESSAGE_MUXSELECTRESPONSE_H
#define TOPIC_TOOLS_MESSAGE_MUXSELECTRESPONSE_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace topic_tools
{
template <class ContainerAllocator>
struct MuxSelectResponse_
{
  typedef MuxSelectResponse_<ContainerAllocator> Type;

  MuxSelectResponse_()
    : prev_topic()  {
    }
  MuxSelectResponse_(const ContainerAllocator& _alloc)
    : prev_topic(_alloc)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>> _prev_topic_type;
  _prev_topic_type prev_topic;





  typedef boost::shared_ptr< ::topic_tools::MuxSelectResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::topic_tools::MuxSelectResponse_<ContainerAllocator> const> ConstPtr;

}; // struct MuxSelectResponse_

typedef ::topic_tools::MuxSelectResponse_<std::allocator<void> > MuxSelectResponse;

typedef boost::shared_ptr< ::topic_tools::MuxSelectResponse > MuxSelectResponsePtr;
typedef boost::shared_ptr< ::topic_tools::MuxSelectResponse const> MuxSelectResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::topic_tools::MuxSelectResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::topic_tools::MuxSelectResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::topic_tools::MuxSelectResponse_<ContainerAllocator1> & lhs, const ::topic_tools::MuxSelectResponse_<ContainerAllocator2> & rhs)
{
  return lhs.prev_topic == rhs.prev_topic;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::topic_tools::MuxSelectResponse_<ContainerAllocator1> & lhs, const ::topic_tools::MuxSelectResponse_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace topic_tools

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::topic_tools::MuxSelectResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::topic_tools::MuxSelectResponse_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::topic_tools::MuxSelectResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::topic_tools::MuxSelectResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::topic_tools::MuxSelectResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::topic_tools::MuxSelectResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::topic_tools::MuxSelectResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "3db0a473debdbafea387c9e49358c320";
  }

  static const char* value(const ::topic_tools::MuxSelectResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x3db0a473debdbafeULL;
  static const uint64_t static_value2 = 0xa387c9e49358c320ULL;
};

template<class ContainerAllocator>
struct DataType< ::topic_tools::MuxSelectResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "topic_tools/MuxSelectResponse";
  }

  static const char* value(const ::topic_tools::MuxSelectResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::topic_tools::MuxSelectResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string prev_topic\n"
"\n"
;
  }

  static const char* value(const ::topic_tools::MuxSelectResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::topic_tools::MuxSelectResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.prev_topic);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct MuxSelectResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::topic_tools::MuxSelectResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::topic_tools::MuxSelectResponse_<ContainerAllocator>& v)
  {
    s << indent << "prev_topic: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>::stream(s, indent + "  ", v.prev_topic);
  }
};

} // namespace message_operations
} // namespace ros

#endif // TOPIC_TOOLS_MESSAGE_MUXSELECTRESPONSE_H
