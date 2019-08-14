# ServiceFrame
SpringCloud基础框架工程，集成eureka、zipkin、config、hystrix、admin
SpringBoot版本号：2.1.7.RELEASE
SpringCloud版本：Greenwich.SR2

模块名称 | 描述 |  访问端口  
-|-|-
eureka | 服务注册中心 | 9999 |
config | 配置中心 | 9998 |
admin | 服务监控 | 9997 |
hystrix | 服务降级和熔断 | 9996 |
zipkin | 链路跟踪 | 9441 |


### 启动流程

- eureka

    浏览器访问,查看已注册服务：http://localhost:9999/
- config
    
   配置文件命名：applicationName+flag.properties，如果有多量相同配置项，则创建applicationName.properties
   
   刷新数据：http://localhost:9998/actuator/bus-refresh
   
   调用实例：http://localhost:9998/hystrix-dev.properties
- zipkin
    
   不需要创建module，下载jar包，运行即可。
   
   下载地址：https://repo1.maven.org/maven2/io/zipkin/zipkin-server/
   
   运行：Java -jar /yourDirectory/zipkin/zipkin-server-2.12.9-exec.jar 
   
   访问地址：http://localhost:9411/zipkin/
- admin
    
   访问地址：http://localhost:9997
- hystrix
    
   访问地址：http://localhost:9996/hystrix

下一步将进行docker部署

*有点别扭的是：最外层创建的是empty project。每次重新构建工程，每一个module需要手动加载。求解决方法？？*
