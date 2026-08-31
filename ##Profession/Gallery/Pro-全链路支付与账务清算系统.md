**技术栈：** Node.js (NestJS), MySQL, Redis, RocketMQ, Crypto

## Situation

- 餐饮行业对钱极其敏感。聚合支付（微信、支付宝、会员卡、团购券）的对账和清算是 SaaS 系统的核心。
- 事务一致性、分布式锁、安全性、补偿机制。

## Task

-  负责餐饮 SaaS 平台的支付中台开发，支撑每日数百万笔流水交易。

## Action

- **分布式事务控制：** 针对“扫码-扣款-下单”链路，利用 **TCC（Try-Confirm-Cancel）模式** 确保在网络波动下的数据最终一致性，杜绝“用户扣款但未下单”的情况。
- **高并发对账：** 面对海量交易流水，利用 Node.js **Worker Threads** 进行多线程并行对账，将 T+1 对账耗时从小时级缩短至分钟级。
- **幂等性设计：** 设计了基于 Redis + Token 的全局幂等机制，有效防止因用户重复点击或网络重试导致的重复支付。

## Quote

```shell
# 参考网站
https://www.njxwst.com/html/solution/224.html
https://www.yixinfa.com/
```