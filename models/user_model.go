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
	OpenId       string
	Token        string
	Topics       []*Topic   `orm:"reverse(many)"`
	Comments     []*Comment `orm:"reverse(many)"`
}

//获取用户信息
func GetUserInfo(id int) (UserInfo, error) {
	o := orm.NewOrm()
	user := UserInfo{Id: id}
	//读取数据
	err := o.Read(&user)
	return user, err
}
