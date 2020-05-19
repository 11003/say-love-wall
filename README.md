
# 由Thinkphp5框架开发的告白墙

## 圣诞主题（后台可变更）

### 前台页面

![](https://upload-images.jianshu.io/upload_images/12353119-4654ce948e763ffd.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![](https://upload-images.jianshu.io/upload_images/12353119-a3f054c1cec8096d.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![](https://upload-images.jianshu.io/upload_images/12353119-04067943ba661fc0.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![](https://upload-images.jianshu.io/upload_images/12353119-167307e4c08dee0e.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![](https://upload-images.jianshu.io/upload_images/12353119-1c455dce345a5f6f.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

## Thinks感谢！

详细跳转[广西科技大学平兄](http://pingxonline.com/)

### 后台功能

- 用户拉黑(gk_blacklist)
- 告白列表管理(gk_posts)
- 主题配置(gk_config)

![](https://upload-images.jianshu.io/upload_images/12353119-73e15f5d90d24e15.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![](https://upload-images.jianshu.io/upload_images/12353119-a6f8196e5ea06041.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

---


# 其他常见问题

### 模块不存在:index

解决方法：不要删除`data文件夹`

[![`Y5`AO{0G2QZ1(S5WSGGTTL.png](https://i.loli.net/2019/07/24/5d3738f96154942529.png)](https://i.loli.net/2019/07/24/5d3738f96154942529.png)

### display.js 和 submit.js 

解决方法：我把它们俩压缩了，分别是：display.min.js 和 submit.min.js 

### 邮箱配置

解决方法：`app -> index -> config.php` 下面

![](https://i.loli.net/2019/07/24/5d373a26ddee161372.png)

### 主要数据表解释

[![5@KZ{A_E`F`VM~E0GW5NYZ9.png](https://i.loli.net/2019/07/24/5d373ac354b2a53976.png)](https://i.loli.net/2019/07/24/5d373ac354b2a53976.png)

1. gk_blacklist     IP拉黑表
2. gk_comments      评论表
3. gk_config        配置表（配置首页大图，排序icon和回到顶部的icon）
4. gk_guess         猜名字表
5. gk_like          点赞表
6. gk_posts         表白表
7. gk_user          用户表(admin,admin)

# 数据库文件

[back/love_liuhai.sql](https://github.com/Haiwar/say-love-wall/tree/master/back)


## 后台

```
账号：test

密码：test
```

[http://love.musclewiki.cn/admin](表白墙后台)

# 最后

MIT；

请给我一个star❤~

就是赞一个。
