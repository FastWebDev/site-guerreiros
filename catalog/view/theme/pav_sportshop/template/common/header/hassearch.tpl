<?php
$this->language( 'module/themecontrol' );
	$objlang = $this->registry->get('language');
 	
	$autosearch = $helper->renderModule( 'pavautosearch' );
	$megamenu = $helper->renderModule('pavmegamenu');
	$verticalmenu = $helper->renderModule('pavverticalmenu');
?>
<header id="header">
<div id="header-main">	
	<div class="container">
		<div class="row">
			<div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 logo inner">
			<?php if( $logoType=='logo-theme'){ ?>
			<div  id="logo-theme" class="logo-store pull-left"><a href="<?php echo $home; ?>" class="img-responsive"><span><?php echo $name; ?></span></a></div>
			<?php } elseif ($logo) { ?>
				<div id="logo" class="logo-store pull-left"><a href="<?php echo $home; ?>" class="img-responsive"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a></div>
			<?php } ?>
			</div>

			<?php if( $content=$helper->getLangConfig('widget_support') ) {?>
			<div class="col-lg-6 col-md-6 hidden-xs hidden-sm inner">
				<?php echo $content; ?>
			</div>
			 <?php } ?>
				
						

			<div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 shopping-cart inner">
				<div class="cart-top pull-right">
					<?php echo $cart; ?>
				</div>
			</div>	
		</div>
	</div>
</div>	
</header>
	
<section id="pav-masshead" class="aligned-right">			
<div class="container">
	<div class="inner row clearfix">
		<?php if(!empty($autosearch)) { ?>
			<div class="col-lg-9 col-md-9 col-sm-12 col-xs-12"> 
				<div id="search-auto" class="search-wrapper"><?php echo $autosearch ?></div> 
			</div>	
			<?php } else { ?>
			<div id="search" class="col-lg-9 col-md-9 col-sm-12 col-xs-12">  
				<?php echo $search; ?>
			</div> 			
			<?php } ?>
			<div id="hidemenu" class="col-lg-3 col-md-3 hidden-sm hidden-xs"> 
				<div class="menuhead-abs">
					<?php if(!empty($verticalmenu)) { ?>
					<?php echo $verticalmenu; ?>
					<?php } ?>
				</div>
			</div>	


	</div>
</div>						
</section>


