<extend name="Layout/ins_base" />
<block name="content">
	<style>
		.box{
			position: absolute;
			width:80%;
			top: 50%;
			left: 50%;
			transform: translate(-50%, -50%);
			box-shadow:10px 10px 10px #ccc;
			text-align: center;
		}
	</style>
	<div class="panel panel-default box">
		<div class="panel-heading">品送提示您:</div>
		<div class="panel-body">
			<?php if(isset($message)) {?>
			<div class="alert alert-success" role="alert">
			<h3>操作成功</h3>
			<p><small><?php echo($message); ?></small></p>
			</div>
			<?php }else{?>
			<div class="alert alert-danger" role="alert">
			<h3>操作失败</h3>
			<p><small><?php echo($error); ?></small></p>
			</div>
			<?php }?>
			<p>页面自动 <a id="href" href="<?php echo($jumpUrl); ?>">跳转</a> 等待时间： <b id="wait"><?php echo($waitSecond); ?></b></p>
		</div>
	</div>
</block>
<block name="js">
	<script type="text/javascript">
		(function(){
			var wait = document.getElementById('wait'),href = document.getElementById('href').href;
			var interval = setInterval(function(){
				var time = --wait.innerHTML;
				if(time <= 0) {
					location.href = href;
					clearInterval(interval);
				};
			}, 1000);
		})();
	</script>
</block>