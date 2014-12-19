package controllers

import (
	. "fmt"
	"github.com/astaxie/beego"
	. "web/models"
)

type LoginController struct {
	beego.Controller
}

//
func (this *LoginController) Post() {

	user, err := GetUserInfo(2)
	if err != nil {
		Println(err)
	}
	this.Data["json"] = user
	this.ServeJson()
}
