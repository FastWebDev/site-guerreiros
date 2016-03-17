
<div class="widget-html <?php echo $addition_cls ?>  <?php if( isset($stylecls)&&$stylecls ) { ?>box-<?php echo $stylecls;?><?php } ?>">
	<?php if( $show_title ) { ?>
		<div class="widget-heading"><?php echo $heading_title; ?></div>
	<?php } ?>
	<div class="widget-inner clearfix">
		 <?php echo htmlspecialchars_decode( $html ); ?>
	</div>
</div>
