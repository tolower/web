<!--头部，菜单-->
{{template "common/head.tpl" .}}

<div class="container-fluid" style="width:80%">
	<div class="row-fluid">
		<div class="col-md-8"  style="border:thin solid #6cf">
			<div class="col-md-12">
				<div class="row" style="border:thin solid #0f0">
					<div class="col-md-4">
						用户头像
					</div>
					<div class="col-md-8">
					 	名称：{{.UserInfo.UserName}}
					</div>
				</div>
			</div>
			<div class="col-md-12"  style="border:thin solid #f00;height:500px">
				他的发言
				
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
		
	</script>	
	</body>
</html>
