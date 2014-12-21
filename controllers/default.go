package controllers

import (
	"fmt"
	"github.com/astaxie/beego"
	. "web/models"
)

type MainController struct {
	beego.Controller
}

func (this *MainController) Get() {
	//查询帖子列表
	topics, err := QueryAllTopic()
	fmt.Println(*(topics[0].UserInfo))
	if err != nil {
		fmt.Println(err)
	} else {
		this.Data["Topics"] = topics
	}
	//
	this.Data["Title"] = "主页"
	this.TplNames = "index.tpl"
}

//发表新帖子
func (this *MainController) Add() {

	this.Data["Title"] = "发表"
	this.TplNames = "add.tpl"

}
