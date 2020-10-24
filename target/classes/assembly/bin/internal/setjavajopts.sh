#!/bin/sh

export JAVA_OPTS="-server -Xms2048m -Xmx2048m -XX:NewRatio=2 -XX:PermSize=256M -XX:MaxPermSize=512M \
          -verbose:GC -XX:+PrintGCDetails -XX:+PrintGCDateStamps -XX:+PrintGCApplicationStoppedTime \
          -Xloggc:${CATALINA_BASE}/logs/gc.log -XX:+HeapDumpOnOutOfMemoryError \
          -Dfile.encoding=UTF-8"