# ServiceFrame
SpringCloud基础框架工程，集成eureka、zipkin、config、hystrix、admin
SpringBoot版本号：2.1.7.RELEASE
SpringCloud版本：Greenwich.SR2

模块名称 | 描述 |  访问端口  
-|-|-
eureka | 服务注册中心 | 9999 |
config | 配置中心 | 9998 |



### 启动流程

- eureka

    浏览器访问：http://localhost:9999/，查看已注册服务
- config




下一步将进行docker部署

*有点别扭的是：最外层创建的是empty project。每次重新构建工程，每一个module需要手动加载。求解决方法？？*
