<!--头部，菜单-->
{{template "common/head.tpl" .}}

<div class="container-fluid" style="width:80%">
	<div class="row-fluid">
		<div class="col-md-8"  style="border:thin solid #fff">
			<div class="col-md-12">
				<div class="row" style="border:thin solid #fff">
					<div class="col-md-8">
						<p><h2><h2></p>
					</div>
					
				</div>
			</div>
			<div class="col-md-12"  style="border:thin solid #f0f;height:100%">
				<div style="word-break: break-all;">
					<h3>{{.Topic.Title}}</h3>
				</div>
				<div>
					用户
					<a href="/user?id={{.Topic.UserInfo.Id}}">{{.Topic.UserInfo.UserName}}</a>
					发表于{{date .Topic.CreateDate "Y-m-d H:i:s"}}
				</div>
				<div style="word-break: break-all;width:100%">
					<pre >{{.Topic.Content |str2html}}</pre>
				</div>
				<div>
					
				</div>
			</div>
			{{range .Topic.Comments}}
				<div class="col-md-12">
					<div class="col-md-1" style="margin-top:15px">
						<img src="http://tb.himg.baidu.com/sys/portrait/item/57346c6f7765725f73636f72696e674d0f"
						 style="width:40px;height:40px;margin-left:0px" />
					</div>
					<div class="col-md-11">
						<div style="border:thin solid #fff;margin-top:15px">
							<div>
								<a href="/user?id={{.UserInfo.Id}}">{{.UserInfo.UserName}}</a>
								{{date .CreateDate "Y-m-d H:i:s"}}
							</div>
							<div style="word-break: break-all;">
								{{.Text}}
							</div>
						</div>
					</div>
				</div>
				
			{{end}}
			<div class="col-md-12"  style="">
				<div class="col-md-1" style="margin-top:15px">
					<img src="http://tb.himg.baidu.com/sys/portrait/item/57346c6f7765725f73636f72696e674d0f"
					 style="width:40px;height:40px;margin-left:0px" />
				</div>
				<div class="col-md-11">
					<textarea id="comment" rows="4" style="width:100%;margin-top:15px" ></textarea>
				</div>
			</div>
			<div class="col-md-12"  style="width:100%;margin-top:15px" >
				<div class="col-md-1" style="margin-top:15px">
					
				</div>
				<div class="col-md-11">
					<div id="notice" class="alert alert-success">
						发表成功！
					</div>
				 	<button id="add" class="btn btn-primary " type="button">发表</button>
					<button class="btn btn-default" onclick="history.go(-1)" >返回</button>
				</div>
			</div>	
		</div>
		
		<!--右侧信息-->
		<div class="col-md-4" style="border:thin solid #fff">
			{{template "common/right.tpl" .}}
		</div>
	</div>
</div>
	<!--底部-->  	
	{{template "common/foot.tpl" .}}
	<script>
		var baseUrl="http://localhost:8080";
		$("#notice").hide();
		$("#add").click(function(){
			var comment=$("#comment").val();
			var topicId='{{.Topic.Id}}';
			var url=baseUrl+"/comment";
			$.post(url,{topicId:topicId,comment:comment},function(result){
				if(result.msg=="success"){
					//alert("发表成功!");
					//显示提示
					$("#notice").show();
					/*
					setTimeout(function(){
						$("#notice").hide();	
					},3000);
					*/
					window.location.reload();
				}else{
					alert("发表失败！");
				}
			});
		});
		
		
	</script>	
	</body>
</html>
