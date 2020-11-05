# ServiceFrame
SpringCloud基础框架工程，集成nacos、zipkin、hystrix、admin
SpringBoot版本号：2.1.7.RELEASE
SpringCloud版本：Greenwich.SR2

模块名称 | 描述 |  访问端口  
-|-|-
nacos | 服务注册+配置中心 | 8848 |
admin | 服务监控 | 9997 |
hystrix | 服务降级和熔断 | 9996 |
zipkin | 链路跟踪 | 9441 |
skywalking-ui | 链路跟踪 | 8880 |

部署方式：

- nacos: docker-compose up -d nacos
    第一次，请使用docker-compose up -d nacos手动创建容器。后续可直接执行命令
    以下服务一样
- zipkin: ./copyfile.sh zipkin/zipkin-server-2.12.9-exec.ja 指定目录
    docker-compose up -d zipkin
- admin: ./publish config bootstrap
- hystrix: ./publish hystrix bootstrap
- skywalking-aop:  docker-compose up -d skywalking-aop
- skywalking-ui:  docker-compose up -d skywalking-ui

### 启动流程

- nacos

    浏览器访问,查看已注册服务：http://localhost:8848/nacos
- zipkin
    
   不需要创建module，下载jar包，运行即可。
   
   下载地址：https://repo1.maven.org/maven2/io/zipkin/zipkin-server/
   
   运行：Java -jar /yourDirectory/zipkin/zipkin-server-2.12.9-exec.jar 
   
   访问地址：http://localhost:9411/zipkin/
- admin
    
   访问地址：http://localhost:9997
- hystrix
    
   访问地址：http://localhost:9996/hystrix

- skywalking-ui

   访问地址：http://localhost:8880
   
   客户端需集成agent：http://mirrors.hust.edu.cn/apache/skywalking/8.1.0/apache-skywalking-apm-8.1.0.tar.gz



#### 问题
- 如果使用rabbitmq，zipkin需要配置环境变量，否则接收不到数据
    zipkin.collector.rabbitmq.addresses=rabbitmq
    zipkin.collector.rabbitmq.username=guest
    zipkin.collector.rabbitmq.password=guest
- 