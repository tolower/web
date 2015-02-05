一个网站
===
1.相关文档资料
---
用go+beego开发的
    
beego开发参考：http://beego.me

前端内容编辑器用了bootstrap-wysiwyg:https://github.com/mindmup/bootstrap-wysiwyg 修改了其中插入文件的相关代码，原来是直接把图片文件数据base64编码，插入到内容中，修改为上传到七牛云服务器，然后返回图片的url地址。用到了七牛云的js（前端）和go（服务器）的相关sdk；

前端添加公司信息时用到了自动补全插件Bootstrap-3-Typeahead：https://github.com/bassjobsen/Bootstrap-3-Typeahead
2.数据库说明：
---
目前4个表，user_info（用户）、topic（帖子）、comment（评论）、company（公司），公司表暂时未使用。

* 关系图：

![](http://lower.u.qiniudn.com/db.png)
3.编译运行调试
---
* 安装和配置go开发环境
* 安装liteide开发工具
* 安装mysql数据库（5.0版本，数据库引擎设置为innerDB）
* 安装beego环境和bee工具
* 用git客户端拉取项目开发代码
* 用bee工具运行代码
* 用liteide调试代码（当前打开为main.go文件，编译、运行、调试才正常）
4.项目结构
---

