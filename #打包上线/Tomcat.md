### 环境变量配置

~~~shell
# 环境变量
CATALINA_HOME 路径
Path %CATALINA_HOME%\lib;%CATALINA_HOME%\lib\servletapi.jar;%CATALINA_HOME%\lib\jsp-api.jar;

# 修改配置_conf/tomcat-user.xml
<role rolename="manager-gui">
<role rolename="admin-gui">
<user username="admin" password="admin" roles="admin-gui">
<user username="tomcat" password="admin" roles="manager-gui">

# 启动服务，双击bin/startup.bat
# 输入http://localhost:8080进入成功
~~~



