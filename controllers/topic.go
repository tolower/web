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
	//获取多值/数组参数时，定义slice对象，用bind方法来获取
	companyList := make([]int, 0, 2)
	this.Ctx.Input.Bind(&companyList, "companyList")

	creatDate := time.Now()

	//fmt.Println("content:", content)
	//fmt.Println("createDate:", creatDate)
	topic := Topic{Content: content, CreateDate: creatDate, Catalog: "吐槽", Title: title, VisitCount: 0}
	user := UserInfo{Id: 1, UserName: "lower"}
	topic.UserInfo = &user
	//fmt.Println("topic:", topic)
	msg := "success"
	id, err := AddTopic(&topic)
	addTopicCompanys(id, companyList)
	if err != nil {
		fmt.Println(err)
		msg = "failed"
	}
	//
	this.Data["json"] = map[string]interface{}{"msg": msg}
	this.ServeJson()
}

//添加帖子与公司关系
func addTopicCompanys(topicId int64, companyList []int) {
	for _, v := range companyList {
		company := Company{Id: v}
		refCompanyTopic := RefCompanyTopic{Company: &company, TopicId: int(topicId)}
		err := AddRefCompanyTopic(&refCompanyTopic)
		if err != nil {
			fmt.Println(err)
		}
	}
}

//获取最新热帖
func (this *TopicController) GetTop10HotTopic() {
	topics, err := QueryTop10HotTopics()
	if err != nil {
		fmt.Println(err)
	}
	this.Data["json"] = map[string]interface{}{"topics": topics}
	this.ServeJson()
}
