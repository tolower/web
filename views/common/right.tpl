<div class="container-fluid">
	<!--个人信息-->
	<div class="row-fluid"  style="border:thin solid #0f0;height:200px">
		<p><h4>众人说=大家一起来吐槽</h4></p>
		
		<a href="#" id="login" class="btn btn-primary btn-sm" style="width:200px" >登   录</a>
	</div>
	<!--最新热贴 -->
	<div class="row-fluid" style="border:thin solid #0f0;height:200px">
		<div><h5><b>最新热贴</b></h5></div>
		<ul >
          <li>帖子一</li>
          <li>帖子一</li>
          <li>帖子一</li>
          <li>帖子一</li>
          <li>帖子一</li>
          <li>帖子一</li>
          <li>帖子一</li>
          <li>帖子一</li>
        </ul>
	</div>
	<!--热门公司 -->
	<div class="row-fluid" style="border:thin solid #0f0;height:200px">
		<div><h5><b>热门公司</b></h5></div>
		<button class="btn btn-primary btn-sm " type="button">A公司</button>
		<button class="btn btn-primary btn-sm " type="button">A公司</button>
		<button class="btn btn-primary btn-sm " type="button">A公司</button>
		<button class="btn btn-primary btn-sm " type="button">A公司</button>
		<button class="btn btn-primary btn-sm " type="button">A公司</button>
		<button class="btn btn-primary btn-sm " type="button">A公司</button>
		<button class="btn btn-primary btn-sm " type="button">A公司</button>
	</div>
</div>
<script>
	
	//登录
	$("#login").click(function(){
		var a=$.layer({
			type:2,
			title:"登录",
			maxmin:true,
			shadeClose:true,
			area:['800px','460px'],
			offset:['100px',''],
			iframe:{src:'/login'}
		});
	});
</script>
	