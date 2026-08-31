[技术栈： Koa, MongoDB (存储非结构化规则), Redis, React]()

## Situation

- 餐饮不仅是线下点餐，更需要线上的优惠券推送、会员等级、积分商城等。(复杂业务建模、规则引擎、高性能查询。)

## Task

- 从 0 到 1 构建的一套支撑千万级会员的营销中台。

## Action

- **动态规则引擎：** 针对“满 X 元减 Y 元”、“会员专享券”、“限时折扣”等复杂叠加逻辑，设计了一套基于**JSON Schema** 的插件化规则引擎，使新活动上线无需改动核心逻辑。
- **精准触达系统：** 利用 Node.js 的异步非阻塞特性，结合 **RabbitMQ** 实现千万级用户的优惠券秒级发放与 Push 推送。
- **性能调优：** 针对 B 端商家极其复杂的“营销效果报表”，通过 MongoDB 的 **AggregationPipeline** 优化聚合查询，提升复杂统计的响应速度。

## Quote

```shell
# 参考网站
https://www.njxwst.com/html/solution/224.html
https://www.yixinfa.com/
```