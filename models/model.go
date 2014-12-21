package models

import (
	"github.com/astaxie/beego/orm"
	_ "github.com/go-sql-driver/mysql"
	"time"
)

//user_info
type UserInfo struct {
	Id           int
	UserName     string
	Password     string
	RegisterDate string
	OpenId       string
	Token        string
	Topics       []*Topic   `orm:"reverse(many)"`
	Comments     []*Comment `orm:"reverse(many)"`
}

//topic
type Topic struct {
	Id         int
	Title      string
	Content    string
	CreateDate time.Time
	Catalog    string
	Type       string
	UserInfo   *UserInfo  `orm:"rel(fk)"`
	Comments   []*Comment `orm:"reverse(many)"`
}

//company
type Company struct {
	Id      int
	Name    string
	Remark  string
	Address string
	Phone   string
	Email   string
}

//comment
type Comment struct {
	Id         int
	Text       string
	CreateDate time.Time
	Topic      *Topic    `orm:"rel(fk)"`
	UserInfo   *UserInfo `orm:"rel(fk)"`
}

//初始化
func init() {
	//注册model
	orm.RegisterModel(new(UserInfo), new(Topic), new(Company), new(Comment))
	//注册驱动
	orm.RegisterDriver("mysql", orm.DR_MySQL)
	//注册数据库
	orm.RegisterDataBase("default", "mysql", "root:root@/web_db?charset=utf8")
}

//获取用户信息
func GetUserInfo(id int) (UserInfo, error) {
	o := orm.NewOrm()
	user := UserInfo{Id: id}
	//读取数据
	err := o.Read(&user)
	return user, err
}

//获取帖子
func GetTopic(id int) (Topic, error) {
	o := orm.NewOrm()
	topic := Topic{Id: id}
	err := o.Read(&topic)
	if topic.UserInfo != nil {
		o.Read(topic.UserInfo)
	}
	return topic, err
}

//添加帖子
func AddTopic(topic *Topic) error {
	o := orm.NewOrm()
	_, err := o.Insert(topic)
	return err
}

//显示所有帖子
func QueryAllTopic() ([]*Topic, error) {
	o := orm.NewOrm()
	var topics []*Topic
	_, err := o.QueryTable("topic").RelatedSel().All(&topics)
	return topics, err
}
