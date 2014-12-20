<div class="container-fluid">
	<!--个人信息-->
	<div class="row-fluid"  style="border:thin solid #0f0;height:200px">
		<p><h4>众人说=大家一起来吐槽</h4></p>
		<span id="qqLoginBtn"></span>
	</div>
	<!--最新热贴 -->
	<div class="row-fluid" style="border:thin solid #0f0;height:200px">
		<div>最新热贴</div>
		<ul >
          <li>帖子一</li>
          <li>体育竞技</li>
          <li>娱乐八卦</li>
          <li>前沿科技</li>
          <li>环球财经</li>
          <li>天气预报</li>
          <li>房产家居</li>
          <li>网络游戏</li>
        </ul>
	</div>
	<!--热门公司 -->
	<div class="row-fluid" style="border:thin solid #0f0;height:200px">
		<div>热门公司</div>
		<button class="btn btn-primary btn-sm " type="button">A公司</button>
		<button class="btn btn-primary btn-sm " type="button">A公司</button>
		<button class="btn btn-primary btn-sm " type="button">A公司</button>
		<button class="btn btn-primary btn-sm " type="button">A公司</button>
		<button class="btn btn-primary btn-sm " type="button">A公司</button>
		<button class="btn btn-primary btn-sm " type="button">A公司</button>
		<button class="btn btn-primary btn-sm " type="button">A公司</button>
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
	
</script>
	