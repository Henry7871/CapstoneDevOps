# CapstoneDevOps
Docker容器间通信方法<br> 
https://juejin.cn/post/6844903847383547911<br>
自定义bridge 负责container间的通信
```
docker network create my-net   
docker network inspect my-net


docker network connect my-net app_node
docker network connect my-net db_mongo

docker network inspect my-net

docker network disconnect bridge app_node
docker network disconnect bridge db_mongo
```
nginx
https://www.cnblogs.com/jianzihao/p/14805893.html

Issues:
1. nginx.conf how to set up app servers according to replicas config
2. .yml depend on label
