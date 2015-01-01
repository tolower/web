<!--头部，菜单-->
{{template "common/head.tpl" .}}

<div class="container-fluid" style="width:80%">
	<div class="row-fluid">
		<div class="col-md-8"  style="border:thin solid #6cf">
			
			<div class="col-md-12"  style="border:thin solid #f00;height:500px">
				搜索结果区
				<!--
				{{range .Topics}}
					<div style="border:thin solid #6cf;margin-top:15px;background-color:#eee">
						<div>标题：<a href="/topic?id={{.Id}}" >{{.Title}}</a></div>
						<div>
							内容摘要：{{.Content}}
						</div>
						<div>
							<a href="/user?id={{.UserInfo.Id}}">{{.UserInfo.UserName}}</a>
							发表于{{date .CreateDate "Y-m-d H:i:s"}}
						</div>
					</div>
				{{end}}
				-->
			</div>
		</div>
		<!--右侧信息-->
		<div class="col-md-4" style="border:thin solid #6cf">
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
	</script>	
	</body>
</html>
