<!--头部，菜单-->
{{template "common/head.tpl" .}}

<div class="container-fluid" style="width:70%">
	<div class="row-fluid">
		<div class="col-md-9"  style="border:thin solid #6cf">
			<div class="col-md-12">
				<div class="row" style="border:thin solid #0f0">
					<div class="col-md-8">
						<p><h2><h2></p>
					</div>
					
				</div>
			</div>
			<div class="col-md-12"  style="border:thin solid #f00;height:500px">
				<div>
					标题：<input type="text" id="title" value="{{.Topic.Title}}" style="width:80%" />
				</div>
				内容：
					{{.Topic.Content}}
				用户：{{.Topic.UserInfo.UserName}}
				时间：{{.Topic.CreateDate}}
			</div>
			<div>
				评论：
				<p>
					<textarea id="commit" rows="10" style="width:100%" ></textarea>
				</p>
				<div class="col-md-4">
				 	<button id="add" class="btn btn-primary " type="button">发表</button>
				</div>	
			</div>
		</div>
		<!--右侧信息-->
		<div class="col-md-3" style="border:thin solid #6cf">
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
		$("#add").click(function(){
			var content=$("#content").val();
			var url=baseUrl+"/topic";
			$.post(url,{content:content},function(result){
				if(result.msg=="success"){
					alert("发表成功!");
					window.location.href=baseUrl;
				}else{
					alert("发表失败！");
				}
			});
		});
	</script>	
	</body>
</html>
