<!--头部，菜单-->
{{template "common/head.tpl" .}}

<div class="container-fluid" style="width:80%">
	<div class="row-fluid">
		<div class="col-md-8"  style="border:thin solid #6cf">
			<div class="col-md-12">
				<div  class="col-md-10" id="companyList">
				</div>
			</div>
			<div class="col-md-12">
				<div><input type="text" id="company" style="width:100%" data-provide="typeahead"/></div>
			</div>
			<div class="col-md-12"  style="border:thin solid #fff;height:500px;margin-top:15px;">
				<div>
					<div>标题：</div>
					<div><input type="text" id="title" style="width:100%" /></div>
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
		var companyList=[];
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
			var title=$("#title").val();
			var url=baseUrl+"/topic";
			$.post("/topic",{content:content,title:title},function(result){
				if(result.msg=="success"){
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
		//自动补全选择公司
		$.get("/company",function(data){
			$("#company").typeahead({
				source:data.companies,
				displayText:function(item){
					return item.Name;
				},
				items:8,
				afterSelect:function(item){
					companyList.push(item.Id);
					$("#companyList").append(
						"<a class='btn btn-sm'>"+item.Name+"</a>"
					);
					$("#company").val("");
				}
			});
		});
		
	</script>	
	</body>
</html>
