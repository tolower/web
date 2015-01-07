<!DOCTYPE html>

<html>
  	<head>
	<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
	<script src="js/layer/layer.min.js"></script>
	<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.2.0/css/bootstrap.min.css">
	<script src="http://cdn.bootcss.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="http://qzonestyle.gtimg.cn/qzone/openapi/qc_loader.js"
        data-appid="101177848" data-redirecturi="http://lower.koding.io:8080"
		 	charset="utf-8"  data-callback="true"></script>
	</head>
	<body>
		<div class="container-fluid" style="width:80%">
			<div class="row-fluid">
				<div class="col-md-12" id="content"  style="border:thin solid #fff;margin-top:20px">
					<span id="qqLoginBtn"></span>
				</div>
				<div>
					<a id="ok" class="btn btn-primary btn-sm" >登录</a>
				</div>
			</div>
		</div>
	<script>
		//调用QC.Login方法，指定btnId参数将按钮绑定在容器节点中
	    QC.Login({
	        //btnId：插入按钮的节点id，必选
	        btnId:"qqLoginBtn",    
	        //用户需要确认的scope授权项，可选，默认all
	        scope:"all",
	        //按钮尺寸，可用值[A_XL| A_L| A_M| A_S|  B_M| B_S| C_S]，可选，默认B_S
	        size: "A_L"
	        }, function(reqData, opts){//登录成功
	             
            //根据返回数据，更换按钮显示状态方法
            var dom = document.getElementById(opts['btnId']),
            _logoutTemplate=[
                 //头像
                 '<span><img src="{figureurl}" class="{size_key}"/></span>',
                 '<span>{nickname}</span>',
                 //退出
                 '<span><a href="javascript:QC.Login.signOut();">退出</a></span>'    
            ].join("");
            dom && (dom.innerHTML = QC.String.format(_logoutTemplate, {
                nickname : QC.String.escHTML(reqData.nickname), //做xss过滤
                figureurl : reqData.figureurl_qq_2
            }));
            /*
            if(QC.Login.check()){
                QC.Login.getMe(function(openID,accessToken){
                     console.log("openID:"+openID+"======token:"+accessToken);
                     //提交url
                     var baseUrl="http://lower.koding.io:8080";
                     var url=baseUrl+"/login/login";
                     //提交参数
                     var data={openID:openID,token:accessToken,nickname:reqData.nickname,figureurl:reqData.figureurl_qq_2};
                     console.log("data:"+data);
                     $.post(url,data,function(result){
                         console.log(result);
                     });
                 })
            }	
			*/	
           }, function(opts){//注销成功
                 alert('QQ登录 注销成功');
                 //提交url
                 var baseUrl="http://lower.koding.io:8080";
                 var url=baseUrl+"/login/logout";
                 //提交参数
                 //var data={openID:openID,token:accessToken,nickname:reqData.nickname,figureurl:reqData.figureurl_qq_2};
                 $.post(url,{},function(result){
                     console.log("logout!");
                 });
           }
        );
		//关闭弹窗
		$("#ok").click(function(){
			var index=parent.layer.getFrameIndex(window.name);
			parent.layer.close(index);
		});
	</script>	
	</body>
</html>