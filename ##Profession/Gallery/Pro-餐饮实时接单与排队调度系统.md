**技术栈：** Node.js, NestJS, Redis, Socket.io, React, MySQL

## Situation

- 餐厅高峰期并发量大，数据库连接池容易打满，导致前端点餐卡顿。

## Task

- 开发多媒体信息发布系统，通过多种显示终端，协助企业高效完成宣传内容的制作、远程发布及管理工作。
- 快速高效的完成不同时期不同时段菜品推荐的节目调整。

## Action

- 引入 **Redis 缓存预热机制**，将门店菜单和活动配置常驻缓存，减少 70% 的数据库查询。
- 采用 **WebSocket 集群方案**，结合 Redis 的 Pub/Sub 模式实现跨服务器的消息推送，确保多台收银机、后厨屏状态秒级同步。
- 前端采用 **React 18 并发模式** 优化长列表渲染，确保在高频推单时界面不掉帧。

## Quote

```shell
# 参考网站
https://www.njxwst.com/html/solution/224.html
https://www.yixinfa.com/
```