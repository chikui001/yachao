#!/bin/sh
cd "$(dirname $0)/../../" || exit 1
WORK_DIR=$(pwd)

PRJ_ENV=${1:-prod}
echo -e "\033[45;37m  执行环境：$PRJ_ENV  \033[0m"

# set env
. "$WORK_DIR"/bin/internal/setenv.sh "$PRJ_ENV"

export JAVA_HOME=$JAVA_HOME
export PATH=$PATH:$JAVA_HOME/bin
export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar:$JRE_HOME/lib/rt.jar
export CATALINA_HOME=$TOMCAT_DIR
export CATALINA_BASE=$WORK_DIR

. "$WORK_DIR"/bin/internal/setjavajopts.sh
export JAVA_OPTS="$JAVA_OPTS -DPRJ_ENV=$PRJ_ENV"
echo "CATALINA_HOME: $CATALINA_HOME"
echo "CATALINA_BASE: $CATALINA_BASE"

TOMCAT_ID=$(ps aux | grep "java" | grep "Dcatalina.base=$CATALINA_BASE " | grep -v "apus" | grep -v "grep" | awk '{print $2}')
echo "TOMCAT_ID: $TOMCAT_ID"

if [ -n "$TOMCAT_ID" ]; then
  echo "${CATALINA_BASE}(${TOMCAT_ID}) is still running now, please shutdown it first"
  exit 2
fi

mkdir -p $WORK_DIR/logs

TOMCAT_START_LOG=$($CATALINA_HOME/bin/startup.sh)

if [ "$?" = "0" ]; then
  echo "tomcat start succeed"
else
  echo "tomcat start failed"
  echo $TOMCAT_START_LOG
fi
