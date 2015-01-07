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
	this.Data["Title"] = topic.Title
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
	user := UserInfo{Id: 1, UserName: "lower"}
	topic.UserInfo = &user
	//fmt.Println("topic:", topic)
	msg := "success"
	/*
		err := AddTopic(&topic)
		if err != nil {
			fmt.Println(err)
			msg = "failed"
		}
	*/
	for i := 0; i < 100000; i++ {
		t := title + strconv.Itoa(i)
		topic.Title = t
		topic.CreateDate = topic.CreateDate.AddDate(0, 0, 1)
		AddTopic(&topic)
	}
	//
	this.Data["json"] = map[string]interface{}{"msg": msg}
	this.ServeJson()
}
