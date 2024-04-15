// Generated by gencpp from file actionlib_msgs/GoalStatus.msg
// DO NOT EDIT!


#ifndef ACTIONLIB_MSGS_MESSAGE_GOALSTATUS_H
#define ACTIONLIB_MSGS_MESSAGE_GOALSTATUS_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <actionlib_msgs/GoalID.h>

namespace actionlib_msgs
{
template <class ContainerAllocator>
struct GoalStatus_
{
  typedef GoalStatus_<ContainerAllocator> Type;

  GoalStatus_()
    : goal_id()
    , status(0)
    , text()  {
    }
  GoalStatus_(const ContainerAllocator& _alloc)
    : goal_id(_alloc)
    , status(0)
    , text(_alloc)  {
  (void)_alloc;
    }



   typedef  ::actionlib_msgs::GoalID_<ContainerAllocator>  _goal_id_type;
  _goal_id_type goal_id;

   typedef uint8_t _status_type;
  _status_type status;

   typedef std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>> _text_type;
  _text_type text;



// reducing the odds to have name collisions with Windows.h 
#if defined(_WIN32) && defined(PENDING)
  #undef PENDING
#endif
#if defined(_WIN32) && defined(ACTIVE)
  #undef ACTIVE
#endif
#if defined(_WIN32) && defined(PREEMPTED)
  #undef PREEMPTED
#endif
#if defined(_WIN32) && defined(SUCCEEDED)
  #undef SUCCEEDED
#endif
#if defined(_WIN32) && defined(ABORTED)
  #undef ABORTED
#endif
#if defined(_WIN32) && defined(REJECTED)
  #undef REJECTED
#endif
#if defined(_WIN32) && defined(PREEMPTING)
  #undef PREEMPTING
#endif
#if defined(_WIN32) && defined(RECALLING)
  #undef RECALLING
#endif
#if defined(_WIN32) && defined(RECALLED)
  #undef RECALLED
#endif
#if defined(_WIN32) && defined(LOST)
  #undef LOST
#endif

  enum {
    PENDING = 0u,
    ACTIVE = 1u,
    PREEMPTED = 2u,
    SUCCEEDED = 3u,
    ABORTED = 4u,
    REJECTED = 5u,
    PREEMPTING = 6u,
    RECALLING = 7u,
    RECALLED = 8u,
    LOST = 9u,
  };


  typedef boost::shared_ptr< ::actionlib_msgs::GoalStatus_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::actionlib_msgs::GoalStatus_<ContainerAllocator> const> ConstPtr;

}; // struct GoalStatus_

typedef ::actionlib_msgs::GoalStatus_<std::allocator<void> > GoalStatus;

typedef boost::shared_ptr< ::actionlib_msgs::GoalStatus > GoalStatusPtr;
typedef boost::shared_ptr< ::actionlib_msgs::GoalStatus const> GoalStatusConstPtr;

// constants requiring out of line definition

   

   

   

   

   

   

   

   

   

   



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::actionlib_msgs::GoalStatus_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::actionlib_msgs::GoalStatus_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::actionlib_msgs::GoalStatus_<ContainerAllocator1> & lhs, const ::actionlib_msgs::GoalStatus_<ContainerAllocator2> & rhs)
{
  return lhs.goal_id == rhs.goal_id &&
    lhs.status == rhs.status &&
    lhs.text == rhs.text;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::actionlib_msgs::GoalStatus_<ContainerAllocator1> & lhs, const ::actionlib_msgs::GoalStatus_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace actionlib_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::actionlib_msgs::GoalStatus_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::actionlib_msgs::GoalStatus_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::actionlib_msgs::GoalStatus_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::actionlib_msgs::GoalStatus_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::actionlib_msgs::GoalStatus_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::actionlib_msgs::GoalStatus_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::actionlib_msgs::GoalStatus_<ContainerAllocator> >
{
  static const char* value()
  {
    return "d388f9b87b3c471f784434d671988d4a";
  }

  static const char* value(const ::actionlib_msgs::GoalStatus_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xd388f9b87b3c471fULL;
  static const uint64_t static_value2 = 0x784434d671988d4aULL;
};

template<class ContainerAllocator>
struct DataType< ::actionlib_msgs::GoalStatus_<ContainerAllocator> >
{
  static const char* value()
  {
    return "actionlib_msgs/GoalStatus";
  }

  static const char* value(const ::actionlib_msgs::GoalStatus_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::actionlib_msgs::GoalStatus_<ContainerAllocator> >
{
  static const char* value()
  {
    return "GoalID goal_id\n"
"uint8 status\n"
"uint8 PENDING         = 0   # The goal has yet to be processed by the action server\n"
"uint8 ACTIVE          = 1   # The goal is currently being processed by the action server\n"
"uint8 PREEMPTED       = 2   # The goal received a cancel request after it started executing\n"
"                            #   and has since completed its execution (Terminal State)\n"
"uint8 SUCCEEDED       = 3   # The goal was achieved successfully by the action server (Terminal State)\n"
"uint8 ABORTED         = 4   # The goal was aborted during execution by the action server due\n"
"                            #    to some failure (Terminal State)\n"
"uint8 REJECTED        = 5   # The goal was rejected by the action server without being processed,\n"
"                            #    because the goal was unattainable or invalid (Terminal State)\n"
"uint8 PREEMPTING      = 6   # The goal received a cancel request after it started executing\n"
"                            #    and has not yet completed execution\n"
"uint8 RECALLING       = 7   # The goal received a cancel request before it started executing,\n"
"                            #    but the action server has not yet confirmed that the goal is canceled\n"
"uint8 RECALLED        = 8   # The goal received a cancel request before it started executing\n"
"                            #    and was successfully cancelled (Terminal State)\n"
"uint8 LOST            = 9   # An action client can determine that a goal is LOST. This should not be\n"
"                            #    sent over the wire by an action server\n"
"\n"
"#Allow for the user to associate a string with GoalStatus for debugging\n"
"string text\n"
"\n"
"\n"
"================================================================================\n"
"MSG: actionlib_msgs/GoalID\n"
"# The stamp should store the time at which this goal was requested.\n"
"# It is used by an action server when it tries to preempt all\n"
"# goals that were requested before a certain time\n"
"time stamp\n"
"\n"
"# The id provides a way to associate feedback and\n"
"# result message with specific goal requests. The id\n"
"# specified must be unique.\n"
"string id\n"
"\n"
;
  }

  static const char* value(const ::actionlib_msgs::GoalStatus_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::actionlib_msgs::GoalStatus_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.goal_id);
      stream.next(m.status);
      stream.next(m.text);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct GoalStatus_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::actionlib_msgs::GoalStatus_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::actionlib_msgs::GoalStatus_<ContainerAllocator>& v)
  {
    s << indent << "goal_id: ";
    s << std::endl;
    Printer< ::actionlib_msgs::GoalID_<ContainerAllocator> >::stream(s, indent + "  ", v.goal_id);
    s << indent << "status: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.status);
    s << indent << "text: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>::stream(s, indent + "  ", v.text);
  }
};

} // namespace message_operations
} // namespace ros

#endif // ACTIONLIB_MSGS_MESSAGE_GOALSTATUS_H
