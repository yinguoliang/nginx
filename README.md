# 源码说明
## 编译说明
1. ./configure会配置objs里面的内容，将各种模块结合到一起  
    参考ngx_modules.c文件




## 技术说明
### TCP链接复用
> TCP链接复用技术是通过将 多个客户端的http请求  
> 复用到后端与服务器建立的一个TCP链接上. [参考链接](http://gaibianziji.blog.51cto.com/1082897/1211940/)   
> TCP链接复用的意思是一个HTTP请求完成之后，TCP链接并不释放，后面的HTTP请求可以使用这个TCP链接继续发送请求。并不是说HTTP请求可以交叉使用。HTTP2好像可以，这里不做讨论。  
> NGINX本身就实现了HTTP协议，所以可以处理很多灵活的功能。

### socket非阻塞
> 可以使用ioctl将socket设置为非阻塞，客户端也是一样  
> nginx反向代理时，可以减少服务器的性能消耗  
> [非阻塞socket](http://blog.csdn.net/wind19/article/details/6157122)   
> [阻塞模式和非阻塞模式](http://blog.csdn.net/wm_1991/article/details/52165496)   
> [设置socket的属性](http://blog.csdn.net/huangqiwa/article/details/21234883)

### 并发
> nginx最大并发数大概50000左右  
> 虽然客户端的socket可以设置为非阻塞的，但是连接还是会占用资源，比如端口，所以并发连接数还是会受到影响的  
> 但是对于外部连接来说，并发数可以远远高于50000，因为这个数字是nginx和后端服务器统一时刻的链接数，但是外部连接可以连上nginx（产生连接事件），等待后台程序的处理。