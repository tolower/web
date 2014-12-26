package controllers

import (
	"fmt"
	"github.com/astaxie/beego"
	"strconv"
	. "web/models"
)

//
type UserController struct {
	beego.Controller
}

//用户信息
func (this *UserController) Get() {
	//获取用户id
	idStr := this.GetString("id")
	id, _ := strconv.Atoi(idStr)
	//查询用户
	u, err := GetUserInfo(id)
	if err != nil {
		fmt.Println(err)
	}
	//设置数据
	this.Data["UserInfo"] = u
	this.Data["Title"] = u.UserName
	this.TplNames = "user.tpl"
}
