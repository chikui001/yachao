#!/bin/sh
cd "$(dirname $0)/../" || exit 1
WORK_DIR=$(pwd)

# set env
sh "$WORK_DIR"/bin/internal/setenv.sh

export CATALINA_HOME=$TOMCAT_DIR
export CATALINA_BASE=$WORK_DIR
echo $CATALINA_BASE

TOMCAT_ID=`ps aux |grep "java"|grep "Dcatalina.base=$CATALINA_BASE "| grep -v "apus" | grep -v "grep"|awk '{print $2}'`

if [ -n "$TOMCAT_ID" ] ; then
	TOMCAT_STOP_LOG=`$CATALINA_HOME/bin/shutdown.sh`
else
    echo "tomcat instance not found : ${CATALINA_BASE}"
    exit
fi

if [ "$?" = "0" ]; then
    echo "tomcat stop succeed"
else
    echo "tomcat stop failed"
    echo $TOMCAT_STOP_LOG
fi
