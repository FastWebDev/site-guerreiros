<?php $objlang = $this->registry->get('language');  $ourl = $this->registry->get('url');   ?>
<div class="product-block" itemtype="http://schema.org/Product" itemscope>
	<?php if( $product['special'] ) {   ?>
		<div class="product-label">
			<div class="product-label-wapper">
				<?php echo $objlang->get( 'text_sale' ); ?>
			</div>
		</div>
	<?php } ?>
	<?php if ($product['thumb']) {    ?>
		 <div class="image">
			<a class="img" href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" class="img-responsive" /></a>
			<?php if( isset($categoryPzoom) && $categoryPzoom ) { $zimage = str_replace( "cache/","", preg_replace("#-\d+x\d+#", "",  $product['thumb'] ));  ?>
				<a href="<?php echo $zimage;?>" class="btn btn-outline-inverse colorbox product-zoom cboxElement" title="<?php echo $product['name']; ?>"><i class="fa fa-search-plus"></i></a>
			<?php } ?>
		<?php if ($quickview) { ?>
		<div class="quickview">
			<a class="pav-colorbox btn btn-outline-inverse cboxElement iframe-link" href="<?php echo $ourl->link('themecontrol/product','product_id='.$product['product_id']);?>"  title="<?php echo $objlang->get('quick_view'); ?>" ><em class="fa fa-eye"></em><span><?php echo $objlang->get('quick_view'); ?></span></a>
		</div>
		<?php } ?> 
		</div>
	<?php } ?>
	
	<div class="product-meta">
		<div class="left">
		  <?php if ( isset( $product['rating']) ) { ?>
          <div class="rating">
            <?php for ($is = 1; $is <= 5; $is++) { ?>
            <?php if ($product['rating'] < $is) { ?>
            <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
            <?php } else { ?>
            <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
            <?php } ?>
            <?php } ?>
          </div>
          <?php } ?>
          <?php if ($product['price']) { ?>
			<div class="price" itemtype="http://schema.org/Offer" itemscope itemprop="offers">
				<?php if (!$product['special']) {  ?>
					<span class="special-price"><?php echo $product['price']; ?></span>
					<?php if( preg_match( '#(\d+).?(\d+)#',  $product['price'], $p ) ) { ?> 
					<meta content="<?php echo $p[0]; ?>" itemprop="price">
					<?php } ?>
				<?php } else { ?>
					<span class="price-new"><?php echo $product['special']; ?></span>
					<span class="price-old"><?php echo $product['price']; ?></span> 
					<?php if( preg_match( '#(\d+).?(\d+)#',  $product['special'], $p ) ) { ?> 
					<meta content="<?php echo $p[0]; ?>" itemprop="price">
					<?php } ?>
				<?php } ?>
				<meta content="<?php?>" itemprop="priceCurrency">
			</div>
			<?php } ?>
		</div>
		<h3 class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h3>
		<?php if( isset($product['description']) ){ ?> 
			<div class="description" itemprop="description"><?php echo utf8_substr( strip_tags($product['description']),0,220);?>...</div>
		<?php } ?>		 	
		<div class="right">
			<div class="action"> 				     
			    <?php if( !isset($listingConfig['catalog_mode']) || !$listingConfig['catalog_mode'] ) { ?>
					<div class="cart">						
						<button onclick="cart.addcart('<?php echo $product['product_id']; ?>');" class="btn btn-shopping-cart btn-outline-inverse">
							<span class="fa fa-shopping-cart"></span>
							<?php echo $objlang->get("button_cart"); ?>
						</button>
					</div>
				<?php } ?>
				<div class="wishlist">
				<a data-toggle="tooltip" data-placement="top" onclick="wishlist.addwishlist('<?php echo $product['product_id']; ?>');" title="<?php echo $objlang->get("button_wishlist"); ?>" class="btn btn-outline">
					<span class="fa fa-heart"></span>
				<span class="hide"><?php echo $objlang->get("button_wishlist"); ?></span>
				</a>	
				</div>	

				<div class="compare">			
				<a data-toggle="tooltip" data-placement="top" class="btn btn-outline" onclick="compare.addcompare('<?php echo $product['product_id']; ?>');" title="<?php echo $objlang->get("button_compare"); ?>">
				<span class="fa fa-files-o"></span>
				<span class="hide"><?php echo $objlang->get("button_compare"); ?></span>
				</a>	
				</div>
			</div>
		</div>
	</div>

</div>





