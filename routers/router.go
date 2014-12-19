package routers

import (
	"github.com/astaxie/beego"
	"web/controllers"
)

func init() {
	//设置静态目录
	beego.SetStaticPath("/img", "static/img")
	beego.SetStaticPath("/css", "static/css")
	beego.SetStaticPath("/js", "static/js")
	//设置路由规则
	beego.Router("/", &controllers.MainController{})
	beego.Router("/login", &controllers.LoginController{})
}
