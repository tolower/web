package models

import (
	"github.com/astaxie/beego/orm"
	_ "github.com/go-sql-driver/mysql"
)

//company
type Company struct {
	Id      int
	Name    string
	Remark  string
	Address string
	Phone   string
	Email   string
}

//获取公司列表
func QueryAllCompanies() ([]*Company, error) {
	o := orm.NewOrm()
	var companies []*Company
	_, err := o.QueryTable("company").All(&companies)
	return companies, err
}
