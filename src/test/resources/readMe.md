#### 第一步 下载代码
#### 第二步 打包 点idea的maven的package，回打出一个zip包
#### 第三步，配置代码中setenv.sh中jdk和tomcat的环境变量
#### 第四步，把zip挪到任意机器中，点击bin/start_dev.sh就启动了tomcat

#### 测试tomcat启动是否正常：
http://localhost:9958/

也可以测试接口：http://localhost:9958/testTop/testGet
这是一个get请求，
以后写接口在controller里头写就行
也可以更改conf/server.xml的9958，为其他端口。使tomcat监听该端口


