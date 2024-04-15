// Generated by gencpp from file topic_tools/DemuxSelectResponse.msg
// DO NOT EDIT!


#ifndef TOPIC_TOOLS_MESSAGE_DEMUXSELECTRESPONSE_H
#define TOPIC_TOOLS_MESSAGE_DEMUXSELECTRESPONSE_H


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
struct DemuxSelectResponse_
{
  typedef DemuxSelectResponse_<ContainerAllocator> Type;

  DemuxSelectResponse_()
    : prev_topic()  {
    }
  DemuxSelectResponse_(const ContainerAllocator& _alloc)
    : prev_topic(_alloc)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>> _prev_topic_type;
  _prev_topic_type prev_topic;





  typedef boost::shared_ptr< ::topic_tools::DemuxSelectResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::topic_tools::DemuxSelectResponse_<ContainerAllocator> const> ConstPtr;

}; // struct DemuxSelectResponse_

typedef ::topic_tools::DemuxSelectResponse_<std::allocator<void> > DemuxSelectResponse;

typedef boost::shared_ptr< ::topic_tools::DemuxSelectResponse > DemuxSelectResponsePtr;
typedef boost::shared_ptr< ::topic_tools::DemuxSelectResponse const> DemuxSelectResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::topic_tools::DemuxSelectResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::topic_tools::DemuxSelectResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::topic_tools::DemuxSelectResponse_<ContainerAllocator1> & lhs, const ::topic_tools::DemuxSelectResponse_<ContainerAllocator2> & rhs)
{
  return lhs.prev_topic == rhs.prev_topic;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::topic_tools::DemuxSelectResponse_<ContainerAllocator1> & lhs, const ::topic_tools::DemuxSelectResponse_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace topic_tools

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::topic_tools::DemuxSelectResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::topic_tools::DemuxSelectResponse_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::topic_tools::DemuxSelectResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::topic_tools::DemuxSelectResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::topic_tools::DemuxSelectResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::topic_tools::DemuxSelectResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::topic_tools::DemuxSelectResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "3db0a473debdbafea387c9e49358c320";
  }

  static const char* value(const ::topic_tools::DemuxSelectResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x3db0a473debdbafeULL;
  static const uint64_t static_value2 = 0xa387c9e49358c320ULL;
};

template<class ContainerAllocator>
struct DataType< ::topic_tools::DemuxSelectResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "topic_tools/DemuxSelectResponse";
  }

  static const char* value(const ::topic_tools::DemuxSelectResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::topic_tools::DemuxSelectResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string prev_topic\n"
"\n"
;
  }

  static const char* value(const ::topic_tools::DemuxSelectResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::topic_tools::DemuxSelectResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.prev_topic);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct DemuxSelectResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::topic_tools::DemuxSelectResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::topic_tools::DemuxSelectResponse_<ContainerAllocator>& v)
  {
    s << indent << "prev_topic: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>::stream(s, indent + "  ", v.prev_topic);
  }
};

} // namespace message_operations
} // namespace ros

#endif // TOPIC_TOOLS_MESSAGE_DEMUXSELECTRESPONSE_H
