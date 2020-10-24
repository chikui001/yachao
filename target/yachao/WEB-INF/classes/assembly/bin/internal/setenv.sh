#!/bin/sh
# setenv.sh不要放到bin目录下，catalina.sh内有执行setenv.sh文件的代码

PRJ_ENV=${1:-def}
echo "设置环境：$PRJ_ENV "

# 默认
# JAVA_HOME目录
JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_251.jdk/Contents/Home
# tomcat安装目录
TOMCAT_DIR=/Users/jiao/Downloads/apache-tomcat-8.5.57

# 本地/开发环境
if [ $PRJ_ENV == "dev" ]; then
  JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_251.jdk/Contents/Home
  TOMCAT_DIR=/Users/jiao/Downloads/apache-tomcat-8.5.57
# 测试环境
elif [ $PRJ_ENV == "test" ]; then
  JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_251.jdk/Contents/Home
  TOMCAT_DIR=/Users/jiao/Downloads/apache-tomcat-8.5.57
# 生产环境
elif [ $PRJ_ENV == "prod" ]; then
  JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_251.jdk/Contents/Home
  TOMCAT_DIR=/Users/jiao/Downloads/apache-tomcat-8.5.57
fi
