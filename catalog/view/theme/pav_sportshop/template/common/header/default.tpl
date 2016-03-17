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

                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 shopping-cart inner ">
                    <div class="cart-top">
                        <?php echo $cart; ?>
                    </div>
                </div>	
            </div>
        </div>
    </div>	


<div id="pav-mainnav">			
    <div class="container">
        <div class="inner">
            <div class="row">
                <div class="col-lg-9 col-md-9 col-sm-9 col-sx-12">
                  <div class="mainnav-wrap">
					<button data-toggle="offcanvas" class="btn btn-primary canvas-menu hidden-lg hidden-md" type="button"><span class="fa fa-bars"></span> Menu</button>
					<?php
					/**
					 * Main Menu modules: as default if do not put megamenu, the theme will use categories menu for main menu
					 */
					$modules = $helper->renderModule('pavmegamenu');

					if (count($modules) && !empty($modules)) { ?>

					    
					<?php echo $modules; ?>
					 

					<?php } elseif ($categories) { ?>

					    <div class="navbar navbar-inverse"> 
					        <nav id="mainmenutop" class="megamenu" role="navigation"> 
					            <div class="navbar-header">
					                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
					                    <span class="sr-only">Toggle navigation</span>
					                    <span class="fa fa-bars"></span>
					                </button>
					            </div>

					            <div class="collapse navbar-collapse navbar-ex1-collapse">
					                <ul class="nav navbar-nav">
					                    
					                    <?php foreach ($categories as $category) { ?>

					                        <?php if ($category['children']) { ?>			
					                            <li class="parent dropdown deeper ">
					                                <a href="<?php echo $category['href']; ?>" class="dropdown-toggle" data-toggle="dropdown"><?php echo $category['name']; ?>
					                                    <b class="fa fa-angle-down"></b>
					                                    <span class="triangles"></span>
					                                </a>
					                            <?php } else { ?>
					                            <li>
					                                <a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
					                            <?php } ?>
					                            <?php if ($category['children']) { ?>
					                                <ul class="dropdown-menu">
					                                    <?php for ($i = 0; $i < count($category['children']);) { ?>
					                                        <?php $j = $i + ceil(count($category['children']) / $category['column']); ?>
					                                        <?php for (; $i < $j; $i++) { ?>
					                                            <?php if (isset($category['children'][$i])) { ?>
					                                                <li><a href="<?php echo $category['children'][$i]['href']; ?>"><?php echo $category['children'][$i]['name']; ?></a></li>
					                                            <?php } ?>
					                                        <?php } ?>
					                                    <?php } ?>
					                                </ul>
					                            <?php } ?>
					                        </li>
					                    <?php } ?>
					                </ul>
					            </div>	
					        </nav>
					    </div>   
					<?php } ?>
				</div>
                </div>


                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 hidden-xs">
                   <?php echo $search; ?>	
                </div>	

            </div>
        </div>
    </div>
</div>

</header>
