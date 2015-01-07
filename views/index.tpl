<!--头部，菜单-->
{{template "common/head.tpl" .}}

<div class="container-fluid" style="width:80%">
	<div class="row-fluid">
		<div class="col-md-8" id="content"  style="border:thin solid #fff">
			
			<input id="lastTime" type="hidden" value=""/>
			<input id="firstTime" type="hidden" value="{{.FirstTime}}"/>
			<div class="col-md-12">
				<div class="row" style="border:thin solid #fff">
					<div class="col-md-8">
						<p><h2>如果你对未来的公司有疑问或者对现在的公司有话要说，那么现在请你勇敢的讲出来<h2></p>
					</div>
					<div class="col-md-4">
					 	<a href="/add" class="btn btn-primary btn-lg " style="margin-top:30px " type="button">让我来说</a>
					</div>
				</div>
			</div>
			{{range .Topics}}
				<div class="col-md-12"  style="border:thin solid #9ff;margin-top:5px;height:100%;background-color:#eff">
					<div class="col-md-1" style="margin-top:15px;" >
						<img src="http://tb.himg.baidu.com/sys/portrait/item/57346c6f7765725f73636f72696e674d0f"
						 style="width:50px;height:50px;margin-left:0px" />
					</div>
					<div class="col-md-11" style="margin-top:15px">
						<div>
							<a href="/user?id={{.UserInfo.Id}}">{{.UserInfo.UserName}}</a>
							发表于{{date .CreateDate "Y-m-d H:i:s"}}
						</div>
						<div style="word-break: break-all;">
							<h4><a href="/topic?id={{.Id}}" title="{{.Title}}" >{{.Title}} </a></h4>
						</div>
						<div style="word-break: break-all;">
							内容摘要：{{.Content|html2str}}
						</div>
						
					</div>
				</div>
			{{end}}
		</div>
		<!--右侧信息-->
		<div class="col-md-4" style="border:thin solid #fff">
			{{template "common/right.tpl" .}}
		</div>
	</div>
	<div>
	<a id="append" class="btn btn-primary btn-sm" >ajax继续加载数据</a>
	</div>
</div>
	<!--底部-->  	
	{{template "common/foot.tpl" .}}
	<script>
		var baseUrl="http://localhost:8080";
		//初始化页面时请求加载数据,如果记录最后一条内容时间字段为空，把最新时间赋给它
		window.onload=function(){
			//如果是刷新整个页面，则清除window.sessionStorage中的数据
			if(!$("#lastTime").val()){
				$("#lastTime").val("{{.LastTime}}");
				window.sessionStorage.lastTime="{{.LastTime}}";
				window.sessionStorage.removeItem("list");
			}
			//加载sessionStorage中的数据
			loadContentData();
		}
		
		$(function(){
			$("#login").click(function(){
				var url=baseUrl+"/login"
				$.post(url,{},function(result){
					console.log(result);
				});
			});
			//下拉到页面底部就请求加载数据
			$(window).scroll(function () {
			    if ($(document).scrollTop() + $(window).height() >= $(document).height()) {
					var lastTime=window.sessionStorage.lastTime;
					var pageSize=10//每次请求加载的数据量
					$.post("/",{lastTime:lastTime,pageSize:pageSize},function(result){
						//更新数据的最后一条时间，用于每次请求加载下一页数据
						window.sessionStorage.lastTime=result.lastTime;
						var list=window.sessionStorage.getItem("list");
						if(!list){
							list=[];
						}else{
							list=JSON.parse(list);
						}
						//list连接新请求的数据列表
						list=list.concat(result.topics);
						window.sessionStorage.setItem("list",JSON.stringify(list));
						appendList(result.topics);
					});
			    }
			});
		})
		//把json格式的时间转换为正常格式
		var toDate=function(datetime){
			var date=datetime.split("T")[0];
			var time=datetime.split("T")[1].split("+")[0];
			return date+" "+time;
		}
		//过滤HTML标签以及&nbsp;
		function removeHTMLTag(str) {
            str = str.replace(/<\/?[^>]*>/g,''); //去除HTML tag
            str = str.replace(/[ | ]*\n/g,'\n'); //去除行尾空白
            //str = str.replace(/\n[\s| | ]*\r/g,'\n'); //去除多余空行
            str=str.replace(/&nbsp;/ig,'');//去掉&nbsp;
            return str;
    	}
		//
		function appendList(list){
			$.each(list,function(i,e){
				//新数据接在原内容之后
				$("#content").append("<div class='col-md-12'  style='border:thin solid #9ff;margin-top:5px;height:100%;background-color:#eff'>"+
					"<div class='col-md-1' style='margin-top:15px;' >"+
						"<img src='http://tb.himg.baidu.com/sys/portrait/item/57346c6f7765725f73636f72696e674d0f'"+
						 "style='width:50px;height:50px;margin-left:0px' />"+
					"</div>"+
					"<div class='col-md-11' style='margin-top:15px'>"+
						"<div>"+
							"<a href='/user?id="+e.UserInfo.Id+"'>"+e.UserInfo.UserName+"</a>"+
								"发表于"+toDate(e.CreateDate)+
						"</div>"+
						"<div style='word-break: break-all;'><h4><a href='/topic?id="+e.Id+"' title='"+e.Title+"' >"+e.Title+" </a></h4></div>"+
						"<div style='word-break: break-all;'>内容摘要："+removeHTMLTag(e.Content)+"</div>"+
						"</div>"+
					"</div>"+
				"</div>");
			});
		}
		//加载内容数据
		function loadContentData(){
			var list=window.sessionStorage.getItem("list");
			if(!list){return;}
			//JSON格式转换为对象
			list=JSON.parse(list);
			appendList(list);
		}
		//下拉到底部时请求加载数据
		$("#append").click(function(){
			/*
			var lastTime=window.sessionStorage.lastTime;
			var pageSize=4//每次请求加载的数据量
			$.post("/",{lastTime:lastTime,pageSize:pageSize},function(result){
				//更新数据的最后一条时间，用于每次请求加载下一页数据
				window.sessionStorage.lastTime=result.lastTime;
				var list=window.sessionStorage.getItem("list");
				if(!list){
					list=[];
				}else{
					list=JSON.parse(list);
				}
				//list连接新请求的数据列表
				list=list.concat(result.topics);
				window.sessionStorage.setItem("list",JSON.stringify(list));
				appendList(result.topics);
			});
			*/
			
			
		});
		
	</script>	
	</body>
</html>
