#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/pi/ros_catkin_ws/src/ros/roscreate"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/opt/ros/melodic/lib/python2.7/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/opt/ros/melodic/lib/python2.7/dist-packages:/home/pi/ros_catkin_ws/build_isolated/roscreate/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/pi/ros_catkin_ws/build_isolated/roscreate" \
    "/usr/bin/python2" \
    "/home/pi/ros_catkin_ws/src/ros/roscreate/setup.py" \
    egg_info --egg-base /home/pi/ros_catkin_ws/build_isolated/roscreate \
    build --build-base "/home/pi/ros_catkin_ws/build_isolated/roscreate" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/opt/ros/melodic" --install-scripts="/opt/ros/melodic/bin"
