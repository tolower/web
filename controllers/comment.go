package controllers

import (
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
	topicId := strconv.Atoi(topicIdStr)
	//构造对象
	com := Comment{Text: comment}
	topic := Topic{Id: topicId}
	com.Topic = &topic
	//保存数据
	err := AddComment(&com)
	msg := "success"
	if err != nil {
		msg = "failed"
	}
	this.Data["json"] = map[string]interface{}{"msg": msg}
	this.ServeJson()
}
