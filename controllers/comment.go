package controllers

import (
	"fmt"
	"github.com/astaxie/beego"
	"strconv"
	. "web/models"
)

//
type CommentController struct {
	beego.Controller
}

//添加评论
func (this *CommentController) Post() {
	comment := this.GetString("comment")
	topicIdStr := this.GetString("topicId")
	topicId, _ := strconv.Atoi(topicIdStr)
	//构造对象
	com := Comment{Text: comment}
	topic := Topic{Id: topicId}
	com.Topic = &topic
	u := UserInfo{Id: 1}
	com.UserInfo = &u
	//保存数据
	err := AddComment(&com)
	msg := "success"
	if err != nil {
		msg = "failed"
		fmt.Println(err)
	}
	this.Data["json"] = map[string]interface{}{"msg": msg}
	this.ServeJson()
}
