> 工具：OpenSSH，dropbear

#### 公钥交换原理

- 客户端发起链接请求
- [服务端返回Public key，会话ID]()
- 客户端生成密钥对
- [Res = ID ^ Public Key => 服务器Public Key加密]()
- [服务器私钥解密 => Public key = ID^Res]()

#### SSH加密通讯原理

#### 服务器相关命令

~~~shell
# SSH连接
ssh 10.0.0.8
~~~

~~~shell
# 目录
cd /etc/ssh/
ls
cat ssh_host_rsa_key.pub
cp ssh_host_rsa_key.pub /data/
cd data
ls
vim ssh_host_rsa_key.pub
cat ssh_host_rsa_key.pub
# 下载目录
/root/ssh
cat known_hosts
# 解密
base64 -d ssh_host_rsa_key.pub | md5sum
# 服务器冒充
ip a a 10.0.0.6/24 dev eth0 label eth0:1
ip a
ip a del 10.0.0.6/24 dev eth0 label eth0:1
# 服务器重启
systemctl restart sshd
# 远程拷贝
scp /eth/ssh/ssh_host_rsa_key 10.0.0.8:/etc/ssh/
~~~

