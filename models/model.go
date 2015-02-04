package models

import (
	"github.com/astaxie/beego"
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
	dbUser := beego.AppConfig.String("db_user")
	dbPwd := beego.AppConfig.String("db_pwd")
	//dbHost := beego.AppConfig.String("db_host")
	dbName := beego.AppConfig.String("db_name")
	orm.RegisterDataBase("default", "mysql", dbUser+":"+dbPwd+"@/"+dbName+"?charset=utf8")
}
