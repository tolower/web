package controllers

import (
	"github.com/astaxie/beego"
	. "web/models"
)

type CompanyController struct {
	beego.Controller
}

//获取公司
func (this *CompanyController) Get() {
	companies, err := QueryAllCompanies()
	if err != nil {

	}
	this.Data["json"] = map[string]interface{}{"companies": companies}
	this.ServeJson()
}
