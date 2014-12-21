package controllers

import (
	"fmt"
	"github.com/astaxie/beego"
	"strconv"
	"time"
	. "web/models"
)

//
type TopicController struct {
	beego.Controller
}

//获取帖子内容
func (this *TopicController) Get() {
	idStr := this.GetString("id")
	id, _ := strconv.Atoi(idStr)
	topic, err := GetTopic(id)
	if err != nil {
		fmt.Println(err)
	}
	this.Data["Topic"] = topic
	this.TplNames = "topic.tpl"
}

//添加帖子
func (this *TopicController) Post() {
	content := this.GetString("content")
	title := this.GetString("title")
	creatDate := time.Now()
	//fmt.Println("content:", content)
	//fmt.Println("createDate:", creatDate)
	topic := Topic{Content: content, CreateDate: creatDate, Catalog: "吐槽", Title: title}
	topic.CompanyId = 1
	topic.CompanyName = "公司"
	user := UserInfo{Id: 1, UserName: "lower"}
	topic.UserInfo = &user
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
