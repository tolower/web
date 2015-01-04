<!--头部，菜单-->
{{template "common/head.tpl" .}}

<div class="container-fluid" style="width:80%">
	<div class="row-fluid">
		<div class="col-md-8"  style="border:thin solid #6cf">
			<div class="col-md-12">
				<div class="row" style="border:thin solid #0f0">
					<div class="col-md-8">
						<p><h2><h2></p>
					</div>
					
				</div>
			</div>
			<div class="col-md-12"  style="border:thin solid #fff;height:500px;margin-top:15px;">
				<div>
					标题：<input type="text" id="title" style="width:90%" />
				</div>
				<!-- 内容编辑器（bootstrap-wysiwyg） -->
				{{template "common/editor.tpl" .}}
				
				<div class="col-md-4" style="margin-top:15px">
					<div id="notice" class="alert alert-success">
						发表成功！
					</div>
				 	<button id="add" class="btn btn-primary " type="button">发表</button>
				 	<button id="cancel" class="btn " type="button">取消</button>
				</div>	
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
		$("#notice").hide();
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
			var content=$("#editor").html();//$("#content").val();
			alert(content);
			var title=$("#title").val();
			var url=baseUrl+"/topic";
			$.post(url,{content:content,title:title},function(result){
				if(result.msg=="success"){
					//alert("发表成功!");
					$("#notice").show();
					window.location.href=baseUrl;
				}else{
					alert("发表失败！");
				}
			});
		});
		$("#cancel").click(function(){
			window.location.href=baseUrl;
		});
		
	</script>	
	</body>
</html>
