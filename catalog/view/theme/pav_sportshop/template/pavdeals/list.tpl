<?php
	$span = floor(12/$cols);
?>
<?php $olang = $this->registry->get('language'); ?>
<?php echo $header; ?>
<div class="container">
	<ul class="breadcrumb">
		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
		<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
		<?php } ?>
	</ul>
	<div class="row"><?php echo $column_left; ?>
	<?php if ($column_left && $column_right) { ?>
	<?php $class = 'col-sm-6'; ?>
	<?php } elseif ($column_left || $column_right) { ?>
	<?php $class = 'col-sm-9'; ?>
	<?php } else { ?>
	<?php $class = 'col-sm-12'; ?>
	<?php } ?>
		<div id="content" class="<?php echo $class; ?> box productdeals"><?php echo $content_top; ?>
			<h3 class="hidden"><?php echo $objlang->get('deal_option'); ?></h3>
			<!-- Deal Option -->
			<div class="">
				<ul class="nav nav-pills">
					<?php foreach ($head_titles as $item): ?>
					<?php if ($item['active']): ?>
					<li class="active"><a href="<?php echo $item['href'];?>"><?php echo $item['text'];?></a></li>
					<?php else: ?>
					<li><a href="<?php echo $item['href'];?>"><?php echo $item['text'];?></a></li>
					<?php endif; ?>
					<?php endforeach; ?>
				</ul>
			</div>

			<!-- Fillter Product -->
			<?php if (count($products) > 0): ?>
			<div class="row product-filter">
			
				 <div class="display">
				    <div class="btn-group group-switch">
				      <button type="button" id="list-view" class="btn btn-switch" data-toggle="tooltip" title="<?php echo $objlang->get("button_list"); ?>"></button>
				      <button type="button" id="grid-view" class="btn btn-switch" data-toggle="tooltip" title="<?php echo $objlang->get("button_grid"); ?>"></button>
				    </div>
				  </div>  
				  

				<div class="text-right">
					<label class="control-label" for="input-sort"><?php echo $objlang->get('text_sort'); ?></label>
				</div>

				<div class="text-right">
					<select id="input-sort" class="form-control col-sm-3" onchange="location = this.value;">
						<?php foreach ($sorts as $sorts) { ?>
						<?php if ($sorts['value'] == $sort . '-' . $order) { ?>
						<option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
						<?php } else { ?>
						<option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
						<?php } ?>
						<?php } ?>
					</select>
				</div>

				<div class="text-right">
					<label class="control-label" for="input-limit"><?php echo $objlang->get('text_limit'); ?></label>
				</div>
				<div class="text-right">
					<select id="input-limit" class="form-control" onchange="location = this.value;">
						<?php foreach ($limits as $limits) { ?>
						<?php if ($limits['value'] == $limit) { ?>
						<option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
						<?php } else { ?>
						<option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
						<?php } ?>
						<?php } ?>
					</select>
				</div><!--end limit-->
				<div class="text-right">
					<label class="control-label" for="input-category"><?php echo $objlang->get('text_category'); ?></label>
				</div>
				<div class="text-right">
					<select id="input-category" class="form-control" name="category_id" onchange="location = this.value;">
						<option value="<?php echo $href_default;?>"><?php echo $objlang->get("text_category_all"); ?></option>
						<?php foreach ($categories as $category_1) { ?>
						<?php if ($category_1['category_id'] == $category_id) { ?>
						<option value="<?php echo $category_1['href']; ?>" selected="selected"><?php echo $category_1['name']; ?></option>
						<?php } else { ?>
						<option value="<?php echo $category_1['href']; ?>"><?php echo $category_1['name']; ?></option>
						<?php } ?>
						<?php foreach ($category_1['children'] as $category_2) { ?>
						<?php if ($category_2['child_id'] == $category_id) { ?>
						<option value="<?php echo $category_2['href']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
						<?php } else { ?>
						<option value="<?php echo $category_2['href']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
						<?php } ?>

						<?php if (isset($category_2['children'])) { ?>
						<?php foreach ($category_2['children'] as $category_3) { ?>
						<?php if ($category_3['child_id'] == $category_id) { ?>
						<option value="<?php echo $category_3['href']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
						<?php } else { ?>
						<option value="<?php echo $category_3['href']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
						<?php } ?>
						<?php } //endforeach categories_2?>
						<?php } //endif endforeach categories_2?>

						<?php } //endforeach categories_1?>
						<?php } //endforeach categories_0?>
					</select>
				</div><!--end category-->
			</div>
			<?php endif; ?>

			<!-- List Product -->
			<?php if (count($products) > 0): ?>
			<div class="box productdeals">
					<div class="products-block">
						<?php foreach( $products as $i => $product ):  $i=$i+1;?>
						<?php if( $i%$cols == 1 || $cols == 1): ?><div class="row products-row"><?php endif; ?>

							<div class="product-col product-layout col-sm-<?php echo $span;?> col-xs-12">

								<div class="product-block">
								<?php if( $product['special'] ):  ?>
											<div class="product-label">
												<div class="product-label-wapper">
													<?php echo $objlang->get( 'text_sale' ); ?>
												</div>
											</div>
										<?php endif; ?>
									<div class="image">
										
										<a href="<?php echo $product['href']; ?>">
											<img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" />
										</a>									
									</div>

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
											<p class="price">
												<?php if (!$product['special']) { ?>
												<?php echo $product['price']; ?>
												<?php } else { ?>
												<span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
												<?php } ?>
												<?php if (!empty($product['tax'])) { ?>
												<span class="price-tax"><?php echo $objlang->get('text_tax'); ?> <?php echo $product['tax']; ?></span>
												<?php } ?>
											</p>
											<?php } ?>
										</div>
										<h3 class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h3>
										<div class="description"><?php echo $product['description']; ?></div>																		
									<!-- count down -->
										<div class="group-deals">
											<div class="deal-collection text-left">
												<div class="deal_detail">
													<ul>
														<li>
															<span><?php echo $objlang->get("text_discount");?></span>
															<span class="deal_detail_num"><?php echo $product['deal_discount'];?>%</span>
														</li>
														<li>
															<span><?php echo $objlang->get("text_you_save");?></span>
															<span class="deal_detail_num"><span class="price"><?php echo $product["save_price"]; ?></span></span>
														</li>
														<li>
															<span><?php echo $objlang->get("text_bought");?></span>
															<span class="deal_detail_num"><?php echo $product['bought'];?></span>
														</li>
													</ul>
												</div>
												<div class="deal-qty-box">
													<?php echo sprintf($objlang->get("text_quantity_deal"), $product["quantity"]);?>
												</div>

												<div class="item-detail">
													<div class="timer-explain">(<?php echo date($objlang->get("date_format_short"), strtotime($product['date_end_string'])); ?>)</div>
												</div>
											</div>
											<div id="item<?php echo $module; ?>countdown_<?php echo $product['product_id']; ?>" class="item-countdown"></div>
											<script type="text/javascript">
												jQuery(document).ready(function($){
													$("#item<?php echo $module; ?>countdown_<?php echo $product['product_id']; ?>").lofCountDown({
														formatStyle:2,
														TargetDate:"<?php echo date('m/d/Y G:i:s', strtotime($product['date_end_string'])); ?>",
														DisplayFormat:"<ul><li>%%D%% <div><?php echo $objlang->get("text_days");?></div></li><li> %%H%% <div><?php echo $objlang->get("text_hours");?></div></li><li> %%M%% <div><?php echo $objlang->get("text_minutes");?></div></li><li> %%S%% <div><?php echo $objlang->get("text_seconds");?></div></li></ul>",
														FinishMessage: "<?php echo $objlang->get('text_finish');?>"
													});
												});
											</script>
										</div>
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


								
							</div>
						<?php if($i%$cols == 0): ?>
						</div>
						<?php endif; ?>

						<?php endforeach; ?>

						
					</div><!--end product-grid-->
				</div><!--end box-content-->

			<!-- end div content list product -->

			<!-- pagination -->
			<div class="row">
				<div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
				<div class="col-sm-6 text-right"><?php echo $results; ?></div>
			</div>
			<?php endif; ?>

			<div class="row">
				<?php if (empty($products)): ?>
				<div class="col-sm-6 text-left"><?php echo $objlang->get('text_not_empty');?></div>
				<div class="col-sm-6 text-right">
					<div class="buttons">
						<div class="pull-right"><a href="<?php echo $objurl->link('common/home'); ?>" class="btn btn-primary"><?php echo $objlang->get('button_continue'); ?></a></div>
					</div>
				</div>
				<?php endif; ?>
			</div>

			<?php echo $content_bottom; ?>
		</div><!-- end div #content -->
		<?php echo $column_right; ?>
	</div><!-- end div .row -->
</div><!-- end div .container -->
<?php echo $footer; ?>
