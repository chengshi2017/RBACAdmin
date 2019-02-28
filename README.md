# RBACAdmin

#### 项目介绍
&emsp;&emsp;个人空闲时间用来学习新技术的一个可进化型项目，后台使用SpringBoot搭建的一套框架，用MyBatis进行数据库操作。数据库主要是用MySQL，同时项目整合Shiro实现权限管理，Quartz实现定时任务的配置，Spring AOP实现操作日志的收集，同时使用redis做Shiro权限框架的缓存管理机制和Session共享；前台使用thymeleaf模板引擎,H-ui前端框架，使用layer弹出层实现页面的跳转，ztree权限信息的展示，Echarts柱状图展示考勤信息。

#### 软件架构
项目演示地址: [点击这里](http://47.96.112.160:9000)，用户名：admin,密码admin123


#### 安装教程

1. 下载本项目
2. 将db文件夹中的sql文件导入到本地，并修改配置文件中数据库连接信息
3. 打开本地redis，将项目配置文件中redis的连接信息修改为本地redis信息
4. 将项目导入idea中，启动项目即可。

#### 功能说明
1. 项目分为七个模块--个人信息管理、权限管理（用户管理、授权管理、角色管理、菜单管理）、部门管理、职位管理、日志管理、员工管理、考勤管理。
2. 员工信息和用户信息已关联，插入一条员工信息，用户中也会出现这条信息，只是自动把这个用户对应角色定义为员工。插入一条用户信息，员工中也会出现这条信息，只是员工对应的部门为HR部门，当然职位可以修改。
3. 系统对权限进行很细的划分，例如权限管理员无法修改系统管理员信息。
4. 更多的功能可以去系统中体验
5. 流程审批正在开发中，待后期完善。。。。。

#### 演示图片
![登录页面](https://hrm-github.oss-cn-hangzhou.aliyuncs.com/2019-02-26_230435.png)
![系统首页](https://hrm-github.oss-cn-hangzhou.aliyuncs.com/2019-02-26_231137.png)
![动态授权](https://hrm-github.oss-cn-hangzhou.aliyuncs.com/2019-02-26_231205.png)
![考勤数据动态展示](https://hrm-github.oss-cn-hangzhou.aliyuncs.com/2019-02-26_232415.png)
![用户管理](https://hrm-github.oss-cn-hangzhou.aliyuncs.com/2019-02-26_232435.png)
![日志展示](https://hrm-github.oss-cn-hangzhou.aliyuncs.com/2019-02-26_232515.png)
![细粒度权限控制](https://hrm-github.oss-cn-hangzhou.aliyuncs.com/2019-02-26_232534.png)
![修改用户信息](https://hrm-github.oss-cn-hangzhou.aliyuncs.com/2019-02-26_232609.png)
![考勤打卡](https://hrm-github.oss-cn-hangzhou.aliyuncs.com/2019-02-26_232624.png)
