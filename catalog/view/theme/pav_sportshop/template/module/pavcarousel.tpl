<?php
$id = rand(1,10);
$span =  12/$columns;
?>
<head>
	<meta name="viewport" content="width=device-width, user-scalable=no">
</head>
<div id="pavcarousel<?php echo $id;?>" class="box box-default carousel slide pavcarousel hidden-sm hidden-xs">
	<div class="box-heading hidden">
			<span><?php echo $objlang->get('text_logo_brand');?></span>
	</div>

	<div class="carousel-inner box-content">
		<?php $pages = array_chunk( $banners, $itemsperpage );?>
		<?php foreach ($pages as $k => $tbanners) {?>
		<div class="item <?php if($k==0) {?>active<?php } ?>">
			<?php foreach( $tbanners as $i => $banner ) {  $i=$i+1;?>
			<?php if( $i%$columns == 1 ) { ?>
			<div class="row">
				<?php } ?>

				<div class="col-lg-<?php echo $span;?> col-md-<?php echo $span;?> col-sm-<?php echo $span;?>">
					<div class="item-inner">
						<?php if ($banner['link']) { ?>
						<a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" /></a>
						<?php } else { ?>
						<img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" />
						<?php } ?>
					</div>
				</div>

				<?php if( $i%$columns == 0 || $i==count($tbanners) ) { ?>
			</div>
			<?php } ?>
			<?php } //endforeach; banner ?>
		</div>
		<?php } //endforeach; pages?>
	</div>

	<?php if( count($banners) > $itemsperpage ){ ?>
	<a class="carousel-control left" href="#pavcarousel<?php echo $id;?>" data-slide="prev">
		<i class="fa fa-angle-left fa-2x"></i>
	</a>
	<a class="carousel-control right" href="#pavcarousel<?php echo $id;?>" data-slide="next">
		<i class="fa fa-angle-right fa-2x"></i>
	</a>
	<?php } ?>

</div>
<?php if( count($banners) > 1 ){ ?>
<script type="text/javascript"><!--
 $('#pavcarousel<?php echo $id;?>').carousel({interval:<?php echo $interval;?>});
--></script>
<?php } ?>
