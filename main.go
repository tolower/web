package main

import (
	"github.com/astaxie/beego"
	_ "web/routers"
)

func main() {
	//beego.AddFuncMap("strlen", strLen)
	beego.Run()
}

//func strLen(str string) int {
//	return len(str)
//}
