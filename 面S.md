# 项目简介

### 点餐小程序

1. 商城模块→点餐模块→订单模块→会员模块
2. 图片轮播|下拉刷新，点餐|订单更新

~~~shell
# 微信登录
1. 调用wx.login登录获取code，传递商户服务器获取openID(session_key)
2. 生成缓存token
# 微信支付
1. 携带支付数据发起支付
2. 后端调用统一下单接口，获取prepay_id,再次签名
3. 小程序获取五个参数后，鉴权调起支付
appId,nonceStr,package,signType,timeStamp
4. 支付回调，后端更新订单状态
# 其他
压缩: 简化代码|gulp配置压缩|分包加载
~~~

### 充值系统

1. 充值模块→积分|优惠券模块|→记录模块
2. 用户信息|更新数据，二维码|Vue-Router跳转

~~~shell
# 二维码
1. 获取openID，生成QRCode二维码
2. 扫描更新数据库
# 跳转支付码
openOfflinePayView
~~~

### 信息发布系统

1. 终端列表模块|发布管理模块|资源管理模块
2. 页面布局|数据渲染更新，Vuex|缓存

~~~shell
# 上传
1. new FormData | fileReader
2. formData.append(file)
# 下载1
1. new Blob =>
URL.createObjectURL(blob)
FileReader.readAsDataURL(blob)
onload=>reader.result
2. body.appendChild(link)
3. link.click()
# 下载2
1. window.location.href
2. window.open
~~~

### 官网

1. 业务宣传|产品/门店展示|招商加盟|留言模块
2. 页面渲染|Router跳转|组件封装|表单提交

~~~shell
# 表单封装
1. 配置表单Data|Props
2. 验证表单
3. 监听方法发送$emit数据
~~~

# 技能

#### 表单封装

#### 用户权限

#### Vue指令

#### 原生交互

#### GitLab