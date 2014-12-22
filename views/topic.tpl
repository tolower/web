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
					标题：{{.Topic.Title}}
				</div>
				<div>
					用户：{{.Topic.UserInfo.UserName}}
				</div>
				<div>
					内容：{{.Topic.Content}}
				</div>
				<div>
					时间：{{.Topic.CreateDate}}
				</div>
			</div>
			<div>
				评论：
				{{range .Topic.Comments}}
					<div>
						用户：{{.UserInfo.UserName}},内容：{{.Text}},
						时间：{{.CreateDate}}
					</div>
				{{end}}
				<p>
					<textarea id="comment" rows="10" style="width:100%" ></textarea>
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
		
		$("#add").click(function(){
			var comment=$("#comment").val();
			var topicId='{{.Topic.Id}}';
			var url=baseUrl+"/comment";
			$.post(url,{topicId:topicId,comment:comment},function(result){
				if(result.msg=="success"){
					alert("发表成功!");
					window.location.reload();
				}else{
					alert("发表失败！");
				}
			});
		});
	</script>	
	</body>
</html>
