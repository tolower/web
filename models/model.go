package models

import (
	"github.com/astaxie/beego/orm"
	_ "github.com/go-sql-driver/mysql"
)

//user_info
type UserInfo struct {
	Id           int
	UserName     string
	Password     string
	RegisterDate string
}

//初始化
func init() {
	//注册model
	orm.RegisterModel(new(UserInfo))
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
