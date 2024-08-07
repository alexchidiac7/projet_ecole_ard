// Generated by gencpp from file actionlib/TwoIntsResult.msg
// DO NOT EDIT!


#ifndef ACTIONLIB_MESSAGE_TWOINTSRESULT_H
#define ACTIONLIB_MESSAGE_TWOINTSRESULT_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace actionlib
{
template <class ContainerAllocator>
struct TwoIntsResult_
{
  typedef TwoIntsResult_<ContainerAllocator> Type;

  TwoIntsResult_()
    : sum(0)  {
    }
  TwoIntsResult_(const ContainerAllocator& _alloc)
    : sum(0)  {
  (void)_alloc;
    }



   typedef int64_t _sum_type;
  _sum_type sum;





  typedef boost::shared_ptr< ::actionlib::TwoIntsResult_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::actionlib::TwoIntsResult_<ContainerAllocator> const> ConstPtr;

}; // struct TwoIntsResult_

typedef ::actionlib::TwoIntsResult_<std::allocator<void> > TwoIntsResult;

typedef boost::shared_ptr< ::actionlib::TwoIntsResult > TwoIntsResultPtr;
typedef boost::shared_ptr< ::actionlib::TwoIntsResult const> TwoIntsResultConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::actionlib::TwoIntsResult_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::actionlib::TwoIntsResult_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::actionlib::TwoIntsResult_<ContainerAllocator1> & lhs, const ::actionlib::TwoIntsResult_<ContainerAllocator2> & rhs)
{
  return lhs.sum == rhs.sum;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::actionlib::TwoIntsResult_<ContainerAllocator1> & lhs, const ::actionlib::TwoIntsResult_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace actionlib

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::actionlib::TwoIntsResult_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::actionlib::TwoIntsResult_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::actionlib::TwoIntsResult_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::actionlib::TwoIntsResult_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::actionlib::TwoIntsResult_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::actionlib::TwoIntsResult_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::actionlib::TwoIntsResult_<ContainerAllocator> >
{
  static const char* value()
  {
    return "b88405221c77b1878a3cbbfff53428d7";
  }

  static const char* value(const ::actionlib::TwoIntsResult_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xb88405221c77b187ULL;
  static const uint64_t static_value2 = 0x8a3cbbfff53428d7ULL;
};

template<class ContainerAllocator>
struct DataType< ::actionlib::TwoIntsResult_<ContainerAllocator> >
{
  static const char* value()
  {
    return "actionlib/TwoIntsResult";
  }

  static const char* value(const ::actionlib::TwoIntsResult_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::actionlib::TwoIntsResult_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n"
"int64 sum\n"
;
  }

  static const char* value(const ::actionlib::TwoIntsResult_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::actionlib::TwoIntsResult_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.sum);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct TwoIntsResult_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::actionlib::TwoIntsResult_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::actionlib::TwoIntsResult_<ContainerAllocator>& v)
  {
    s << indent << "sum: ";
    Printer<int64_t>::stream(s, indent + "  ", v.sum);
  }
};

} // namespace message_operations
} // namespace ros

#endif // ACTIONLIB_MESSAGE_TWOINTSRESULT_H
