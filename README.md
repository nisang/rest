


## 一：项目说明
* 1.项目：restweb（web模板项目）
* 2.项目：restapi（api模板项目）
* 3.项目：restapi-library
* 4.项目：restapi-rw（读写库分离）

## 二：架构
* Spring Boot 1.5.1 + Dubbo 2.8.4 + Mybatis + shiro + mysql+redis
* 组件：oss + mq + 环信 + elasticsearch（搜索引擎）+jpush + pageHelper（mybatis分页）+fastweixin

* dubbo默认不开启，把com.che.core.dubbo 下的java类，@Configuration注解打开



## 三：接口编写推荐风格

* restful api : http://www.ruanyifeng.com/blog/2011/09/restful
	* RESTful架构：
	* (1) 每一个URI代表一种资源；
	* (2) 客户端和服务器之间，传递这种资源的某种表现层；
	* (3) 客户端通过四个HTTP动词，对服务器端资源进行操作，实现"表现层状态转化"。
* HTTP协议动词：
	* GET、POST、PUT、DELETE
	* GET用来获取资源，POST用来新建资源（也可以用于更新资源），PUT用来更新资源，DELETE用来删除资源


## 使用说明

* -1. 初始数据库：
	* 1.在restapi-library项目sql文件夹中，init.sql 初始化数据库脚本
	* 2.其他表作为基础表，可根据业务修改。
	* 3.项目中已实现登录逻辑及新增用户逻辑。

* 0.项目启动
	* com.che.run.Application
	* 端口修改：com.che.run.Application.customize()
	
* 1.分页使用案例

	* 见com.che.common.contoller.AreaController.getCitys()

* 2.jsp
 	* com.che.common.contoller.AreaController.getCitys1()
	
* 3.jsonp请求请见

	* com.che.config.JsonpAdvice

* 4.socket
	* com.che.config.WebSocketConfig
	* 浏览器端使用案例：/WEB-INF/views/jsp/ws.jsp
	* java后端使用案例：com.che.websocket.controller
	
* 5.spring component 组件单例化参考

	* com.che.config.OSSConfig

* 6.shiro权限配置
	* com.che.config.security.ShiroSecurityConfig
	* com.che.config.JpushUtil
	
* 7.spring mvc 配置

	* com.che.config.MvcConfig



## 开源项目使用

### 1.使用dubbox 2.8.4
* https://github.com/dangdangdotcom/dubbox

### 2.1 搜索引擎
* elasticsearch
### 2.2 分词

* IKAnalyzer2012FF_u1 (未使用)

* http://git.oschina.net/wltea/IK-Analyzer-2012FF

### 3.lombok

* https://projectlombok.org/

### 4.pageHelper

* https://github.com/pagehelper/Mybatis-PageHelper

### 5.fastweixin

* http://git.oschina.net/pyinjava/fastweixin

### 6.druid

* https://github.com/druid-io/druid/

### 7.还有许多需要去熟悉的

## 项目还需努力的方向


* Spring Cache
* Spring Cloud
* Spring Data