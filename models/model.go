package models

import (
	"github.com/astaxie/beego/orm"
	_ "github.com/go-sql-driver/mysql"
)

//初始化
func init() {
	//注册model
	orm.RegisterModel(new(UserInfo), new(Topic), new(Company), new(Comment))
	//注册驱动
	orm.RegisterDriver("mysql", orm.DR_MySQL)
	//注册数据库
	orm.RegisterDataBase("default", "mysql", "root:root@/web_db?charset=utf8")
}
