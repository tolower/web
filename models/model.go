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
}

//topic
type Topic struct {
	Id          int
	Content     string
	CreateDate  time.Time
	Catalog     string
	Type        string
	CompanyId   int
	CompanyName string
	UserId      int
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

//初始化
func init() {
	//注册model
	orm.RegisterModel(new(UserInfo), new(Topic), new(Company))
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
	_, err := o.QueryTable("topic").All(&topics)
	return topics, err
}
