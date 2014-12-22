package controllers

import (
	"fmt"
	"github.com/astaxie/beego"
	"strconv"
	"time"
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
	createDate := time.Now()
	com := Comment{Text: comment, CreateDate: createDate, State: "1", Ip: this.Ctx.Input.Host()}
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
