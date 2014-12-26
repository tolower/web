package controllers

import (
	"github.com/astaxie/beego"
)

//
type SearchController struct {
	beego.Controller
}

//
func (this *SearchController) Get() {

	this.Data["Title"] = "搜索"
	this.TplNames = "search.tpl"
}
