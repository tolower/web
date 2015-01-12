package models

import (
	"fmt"
	"github.com/astaxie/beego/orm"
	_ "github.com/go-sql-driver/mysql"
	"time"
)

//topic
type Topic struct {
	Id         int
	Title      string
	Content    string
	CreateDate time.Time
	Catalog    string
	Type       string
	VisitCount int
	UserInfo   *UserInfo  `orm:"rel(fk)"`
	Comments   []*Comment `orm:"reverse(many)"`
}

//获取帖子
func GetTopic(id int) (Topic, error) {
	o := orm.NewOrm()
	topic := Topic{Id: id}
	//RelatedSel关联查询,关联查询会对表做关联，表数据量太多的话，性能可能会差
	//可以单表查询，然后把查询结果直接放进对象的相应属性中
	err := o.QueryTable("topic").Filter("Id", id).RelatedSel().One(&topic)
	topic.VisitCount += 1
	//指定要更新的字段
	go o.Update(&topic, "VisitCount")
	_, err = o.QueryTable("comment").Filter("topic_id", topic.Id).RelatedSel().All(&topic.Comments)
	/*
		err := o.Read(&topic)
		if topic.UserInfo != nil {
			o.Read(topic.UserInfo)
		}
		if topic.Comments !=nil{
			o.Read
		}
	*/
	return topic, err
}

//添加帖子
func AddTopic(topic *Topic) error {
	o := orm.NewOrm()
	_, err := o.Insert(topic)
	return err
}

//显示所有帖子,排序：按照发帖时间降序排列，最新发表的内容在最前面
func QueryAllTopic(limit int) ([]*Topic, error) {
	o := orm.NewOrm()
	var topics []*Topic
	_, err := o.QueryTable("topic").Limit(limit, 0).OrderBy("-create_date").RelatedSel().All(&topics)
	return topics, err
}

//分页查询帖子
func QueryTopicsWithPage(lastTime string, pageSize int) ([]*Topic, error) {
	o := orm.NewOrm()
	var topics []*Topic
	_, err := o.QueryTable("topic").Filter("create_date__lt", lastTime).Limit(pageSize, 0).OrderBy("-create_date").RelatedSel().All(&topics)
	return topics, err
}

//查询最新热门10条帖子
func QueryTop10HotTopics() ([]*Topic, error) {
	o := orm.NewOrm()
	var topics []*Topic
	_, err := o.QueryTable("topic").Limit(10, 0).OrderBy("-visit_count").All(&topics)
	return topics, err
}
