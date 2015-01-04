package controllers

import (
	"github.com/astaxie/beego"
	. "github.com/qiniu/api/conf"
	"github.com/qiniu/api/rs"
)

type UploadController struct {
	beego.Controller
}

func (this *UploadController) Post() {
	ACCESS_KEY = "UbPMIrI1X6dGuGQ8WDupAh5VnP5-9yteLylzyT4v"
	SECRET_KEY = "oB1P8ZgQ0MIDIIInO0hei2heUTFRotMREMGd2Mxh"
	bucket := "lower"
	putPolicy := rs.PutPolicy{
		Scope: bucket,
	}
	this.Data["json"] = map[string]interface{}{"uptoken": putPolicy.Token(nil)}
	this.ServeJson()
}
