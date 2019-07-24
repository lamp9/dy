# 项目详情
## 环境配置
1. PHP7.0 以上版本
2. MYSQL5.7 以上版本
3. Centos7 以上版本
4. nginx 

## 项目安装

1. 新建数据库
2. 导入Sql/database.sql 文件夹
3. 修改application/database.php 文件夹

```
// 数据库类型
'type'            => Env::get('database.type', 'mysql'),
// 服务器地址
'hostname'        => Env::get('database.hostname', '127.0.0.1'),
// 数据库名
'database'        => Env::get('database.database', 'vpn'),
// 用户名
'username'        => Env::get('database.username', 'root'),
// 密码
'password'        => Env::get('database.password', '123'),
// 端口
'hostport'        => Env::get('database.hostport', ''),

```
4. 修改swagger相关配置 修改baseURL
5. runtime 文件夹写入权限
6. application/api/controller/Vpn.php
    application/admin/controller/vpn/Test.php

```
修改 服务端java URL和端口
private $BASE_URL="http://localhost:8080/";
```

## swagger相关配置
## MAC 修改url 映射 linux Windows 自行谷歌

    追加一行
    
    echo '127.0.0.1   	www.vpn.com' >> /etc/hosts 
 
api/controller/api.php

1. 要修改baseURL  host="www.vpn.com" line 6

api/controller/Doc.php

1. 修改URL http://www.vpn.com ；换回你自己的 $this->redirect('http://www.vpn.com/swagger-ui/dist/index.html'); line 23 

public/swagger-ui/index.html

1. 修改URL http://www.vpn.com
    line 41 $.get("http://www.vpn.com/api/doc/reload");
    line 46 url = "http://www.vpn.com/assets/js/swagger.json?hash"+random(1,1000);

API 接口调试地址
swagger 
http://www.vpn.com/swagger-ui/dist/index.html

## 项目架构
server 服务端 java 需要先启动( 代码已完成 )
manager 管理端 php 进行中
api 接口 php (php通过http与java通讯，启动管理vpn)
客户端 IOS Android

JAVA 暴露给PHP的接口

创建 http://localhost:8080/vpn/create
启动 http://localhost:8080/vpn/start
暂停 http://localhost:8080/vpn/stop/vpn_xxx
修改密码 http://localhost:8080/vpn/change
在线人数 http://localhost:8080/vpn/size

注：
    localhost:8080 为本地java启动测试地址
    客户端发起启动请求，由PHP调JAVA接口。不能直接通过客户端对JAVA操作

PHP 暴露给客户端接口 详见 swagger或者 PHP

    
    
    
    
 


