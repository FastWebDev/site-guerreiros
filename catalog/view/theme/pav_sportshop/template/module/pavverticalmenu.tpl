<?php $objlang = $this->registry->get('language');?>
<div id="pav-verticalmenu" class="box pav-verticalmenu nopadding">
	<div class="box-heading">
		<span class="box-title"><i class="icon-menu fa fa-bars"></i><?php echo $objlang->get('text_catalog_menu'); ?></span>
	</div>
	<div class="box-content no-padding">
			<div id="verticalmenu" class="verticalmenu" role="navigation">
			<div class="navbar navbar-vertical">
				<div class="navbar-header">
					<a href="javascript:;" data-target=".navbar-collapse" data-toggle="collapse" class="navbar-toggle">
				        <span class="fa fa-bars"></span>
					</a>
					<div class="collapse navbar-collapse navbar-ex1-collapse">
						<?php echo $treemenu; ?>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>