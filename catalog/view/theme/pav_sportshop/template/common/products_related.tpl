<?php 

	$config = $this->registry->get('config'); 

	$cols = 3;
	$span = 12/$cols;

	$themeConfig  	 			= (array)$config->get('themecontrol');
	$listingConfig  			= array( 		
		'category_pzoom' 		=> 1,
		'show_swap_image' 		=> 0,
		'quickview' 			=> 0,
		'product_layout'		=> 'default',
		'catalog_mode'			=> '',
	); 
	$listingConfig  			= array_merge($listingConfig, $themeConfig );
	$categoryPzoom 	    		= $listingConfig['category_pzoom'];
	$quickview 					= $listingConfig['quickview'];
	$swapimg 					= ($listingConfig['show_swap_image'])?'swap':'';
 

	$productLayout = DIR_TEMPLATE.$config->get('config_template').'/template/common/product/'.$listingConfig['product_layout'].'.tpl';	
	if( !is_file($productLayout) ){
		$listingConfig['product_layout'] = 'default';
	}
	$productLayout = DIR_TEMPLATE.$config->get('config_template').'/template/common/product/'.$listingConfig['product_layout'].'.tpl';	
	$ourl = $this->registry->get('url');  
?>
<div class="tab-nav">
	<ul  class="nav nav-pills">
		<li class="active"><a data-toggle="tab"><?php echo $heading_title; ?> (<?php echo count($products); ?>)</a></li>
	</ul>
</div>
<?php if(!empty($products)){ ?>
	<div id="product-related" class="slide" data-interval="0">
		<?php if(count($products) > $span){ ?>
		 <div class="carousel-controls">
	      <a class="carousel-control left" href="#product-related" data-slide="prev">
	      	<i class="fa fa-angle-left"></i>
	      </a>
	      <a class="carousel-control right" href="#product-related" data-slide="next">
	      	<i class="fa fa-angle-right"></i>
	      </a>
	    </div>
		<?php } ?>
		<div class="products-block carousel-inner">
			<?php foreach ($products as $i => $product) { $i=$i+1; ?>
			<?php if( $i%$cols == 1 && $cols > 1 ) { ?>
			<div class= "item <?php if($i==1) {?>active<?php } ?>">
				<div class="row products-row">
			<?php } ?>
				<div class="col-lg-<?php echo $span;?> col-md-<?php echo $span;?> col-sm-6 col-xs-12 product-col">
					<?php require( $productLayout );  ?>
				</div>
			<?php if( $cols > 1  && ($i%$cols == 0 || $i==count($products)) ) { ?>
				</div>
			</div>
			<?php } ?>
			<?php } ?>
		</div>
	</div>
<?php } ?>