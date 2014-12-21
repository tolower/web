package controllers

import (
	"fmt"
	"github.com/astaxie/beego"
	"time"
	. "web/models"
)

//
type TopicController struct {
	beego.Controller
}

//添加帖子
func (this *TopicController) Post() {
	content := this.GetString("content")
	creatDate := time.Now()
	//fmt.Println("content:", content)
	//fmt.Println("createDate:", creatDate)
	topic := Topic{Content: content, CreateDate: creatDate, Catalog: "吐槽"}
	topic.CompanyId = 1
	topic.CompanyName = "公司"
	//fmt.Println("topic:", topic)
	msg := "success"
	err := AddTopic(&topic)
	if err != nil {
		fmt.Println(err)
		msg = "failed"
	}
	//
	this.Data["json"] = map[string]interface{}{"msg": msg}
	this.ServeJson()
}
