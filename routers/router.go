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
	beego.Router("/add", &controllers.MainController{}, "get:Add")
	beego.Router("/login", &controllers.LoginController{})
	beego.Router("/topic", &controllers.TopicController{})
	beego.Router("/top10hot", &controllers.TopicController{}, "post:GetTop10HotTopic")
	beego.Router("/comment", &controllers.CommentController{})
	beego.Router("/user", &controllers.UserController{})
	beego.Router("/search", &controllers.SearchController{})
	beego.Router("/uptoken", &controllers.UploadController{})
	beego.Router("/company", &controllers.CompanyController{})
	//添加模板函数
	beego.AddFuncMap("strlen", strLen)
}

//
func strLen(str string) int {
	return len(str)
}
