package controllers

import (
	"fmt"
	"github.com/astaxie/beego"
	"strconv"
	"time"
	. "web/models"
)

type MainController struct {
	beego.Controller
}

func (this *MainController) Get() {
	//查询帖子列表
	topics, err := QueryAllTopic(3)
	fmt.Println(*(topics[0].UserInfo))
	if err != nil {
		fmt.Println(err)
	} else {
		this.Data["Topics"] = topics
		length := len(topics)
		if length <= 0 {
			fmt.Println("no data")
		}
		lastTopic := topics[length-1]
		this.Data["LastTime"] = lastTopic.CreateDate
		this.Data["FirstTime"] = topics[0].CreateDate
	}
	//
	fmt.Println("[log]:access :/")
	this.Data["Title"] = "主页"
	this.TplNames = "index.tpl"
}

//分页加载数据,根据加载数据的最后一条的时间，查询更早的数据
func (this *MainController) Post() {
	lastTime := this.GetString("lastTime")
	pageSizeStr := this.GetString("pageSize")
	pageSize, _ := strconv.Atoi(pageSizeStr)
	//查询数据
	topics, err := QueryTopicsWithPage(lastTime, pageSize)
	if err != nil {
		fmt.Println(err)
	}
	length := len(topics)
	var LastTime time.Time
	if length > 0 {
		LastTime = topics[length-1].CreateDate
	}
	this.Data["json"] = map[string]interface{}{"topics": topics, "lastTime": LastTime}
	this.ServeJson()
}

//发表新帖子
func (this *MainController) Add() {

	this.Data["Title"] = "发表"
	this.TplNames = "add.tpl"

}
