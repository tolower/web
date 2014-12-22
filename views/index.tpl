<!--头部，菜单-->
{{template "common/head.tpl" .}}

<div class="container-fluid" style="width:70%">
	<div class="row-fluid">
		<div class="col-md-9"  style="border:thin solid #6cf">
			<div class="col-md-12">
				<div class="row" style="border:thin solid #0f0">
					<div class="col-md-8">
						<p><h2>如果你对未来的公司有疑问或者对现在的公司有话要说，那么现在请你勇敢的讲出来<h2></p>
					</div>
					<div class="col-md-4">
					 	<a href="/add" class="btn btn-primary " type="button">让我来说</a>
					</div>
				</div>
			</div>
			<div class="col-md-12"  style="border:thin solid #f00;height:500px">
				内容区
				{{range .Topics}}
					<div style="border:thin solid #6cf;margin-top:15px">
						用户：{{.UserInfo.UserName}}，
						标题：<a href="/topic?id={{.Id}}" >{{.Title}}</a>
						内容：{{.Content}}，时间：{{.CreateDate}}
					</div>
				{{end}}
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
	</script>	
	</body>
</html>
