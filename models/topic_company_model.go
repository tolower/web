package models

import (
	"github.com/astaxie/beego/orm"
	_ "github.com/go-sql-driver/mysql"
)

//topic
type RefCompanyTopic struct {
	Id      int
	Company *Company `orm:"rel(fk)"`
	TopicId int
}

//添加
func AddRefCompanyTopic(refCompanyTopic *RefCompanyTopic) error {
	o := orm.NewOrm()
	_, err := o.Insert(refCompanyTopic)
	return err
}

//获取
func GetRefCompanyTopic(id int) (RefCompanyTopic, error) {
	o := orm.NewOrm()
	refCompanyTopic := RefCompanyTopic{Id: id}
	err := o.QueryTable("ref_company_topic").Filter("id", id).RelatedSel().One(&refCompanyTopic)
	return refCompanyTopic, err
}

// 根据topicid查询相关公司列表
func QueryCompanyTopicsByTopicId(topicId int) ([]*RefCompanyTopic, error) {
	o := orm.NewOrm()
	var refCompanyTopic []*RefCompanyTopic
	_, err := o.QueryTable("ref_company_topic").Filter("topic_id", topicId).RelatedSel().All(&refCompanyTopic)
	return refCompanyTopic, err
}

//根据company_id查询相关帖子列表
func QueryCompanyTopicsByCompanyId(companyId int) ([]*RefCompanyTopic, error) {
	o := orm.NewOrm()
	var refCompanyTopic []*RefCompanyTopic
	_, err := o.QueryTable("ref_company_topic").Filter("company_id", companyId).RelatedSel().All(&refCompanyTopic)
	return refCompanyTopic, err
}
