package models

import (
	"github.com/astaxie/beego/orm"
	_ "github.com/go-sql-driver/mysql"
	"time"
)

//comment
type Comment struct {
	Id         int
	Text       string
	CreateDate time.Time
	Ip         string
	State      string
	Topic      *Topic    `orm:"rel(fk)"`
	UserInfo   *UserInfo `orm:"rel(fk)"`
}

//添加评论
func AddComment(comment *Comment) error {
	o := orm.NewOrm()
	_, err := o.Insert(comment)
	return err
}
