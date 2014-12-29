<!--头部，菜单-->
{{template "common/head.tpl" .}}

<div class="container-fluid" style="width:70%">
	<div class="row-fluid">
		<div class="col-md-9" id="content"  style="border:thin solid #fff">
			<a id="append" class="btn btn-sm" >append</a>
			<input id="lastTime" type="hidden" value="{{.LastTime}}"/>
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
				<div class="col-md-12"  style="border:thin solid #fff;margin-top:5px;height:100%;background-color:#eff">
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
							内容摘要：{{.Content}}
						</div>
						
					</div>
				</div>
			{{end}}
		</div>
		<!--右侧信息-->
		<div class="col-md-3" style="border:thin solid #fff">
			{{template "common/right.tpl" .}}
		</div>
	</div>
</div>
	<!--底部-->  	
	{{template "common/foot.tpl" .}}
	<script>
		var baseUrl="http://localhost:8080";
		$(function(){
			$("#login").click(function(){
				var url=baseUrl+"/login"
				$.post(url,{},function(result){
					console.log(result);
				});
			});
			
		})
		//加载数据
		$("#append").click(function(){
			var lastTime=$("#lastTime").val();
			$.post("/",{lastTime:lastTime},function(result){
				console.log(result);
			});
			/*
			$("#content").append("<div class='col-md-12'  style='border:thin solid #fff;margin-top:5px;height:100%;background-color:#eff'>"+
				"<div class='col-md-1' style='margin-top:15px;' >"+
					"<img src='http://tb.himg.baidu.com/sys/portrait/item/57346c6f7765725f73636f72696e674d0f'"+
					 "style='width:50px;height:50px;margin-left:0px' />"+
				"</div>"+
				"<div class='col-md-11' style='margin-top:15px'>"+
					"<div>"+
						"<a href='/user?id={{.UserInfo.Id}}'>UserName</a>"+
							"发表于}"+
					"</div>"+
					"<div style='word-break: break-all;'><h4><a href='/topic?id={{.Id}}' title='{{.Title}}' >{{.Title}} </a></h4></div>"+
					"<div style='word-break: break-all;'>内容摘要：{{.Content}}</div>"+
					"</div>"+
				"</div>"+
			"</div>");
			*/
		});
	</script>	
	</body>
</html>
