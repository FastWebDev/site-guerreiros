<?php
  /*
  * @package Framework for Opencart 2.0
  * @version 2.0
  * @author http://www.pavothemes.com
  * @copyright Copyright (C) Feb 2013 PavoThemes.com <@emai:pavothemes@gmail.com>.All rights reserved.
  * @license   GNU General Public License version 2
  */
  require_once(DIR_SYSTEM . 'pavothemes/loader.php');
  $config = $this->registry->get('config');
  $helper = ThemeControlHelper::getInstance( $this->registry, $config->get('config_template') );
?>
 <?php $objlang = $this->registry->get('language');  $ourl = $this->registry->get('url');   ?>
<!--
  $ospans: allow overrides width of columns base on thiers indexs. format array( column-index=>span number ), example array( 1=> 3 )[value from 1->12]
 -->

<?php if( !($helper->getConfig('enable_pagebuilder') && $helper->isHomepage())  ){ ?>

<?php
  $blockid = 'mass_bottom';
  $blockcls = '';

  $ospans = array();
  $tmcols = 'col-sm-12 col-xs-12';
  require( ThemeControlHelper::getLayoutPath( 'common/block-cols.tpl' ) );


?>

<?php } ?>

<footer id="footer">

  <?php
    $blockid = 'footer_top';
    $blockcls = '';
    $ospans = array();
    require( ThemeControlHelper::getLayoutPath( 'common/block-footcols.tpl' ) );
  ?>
   <?php
    $blockid = 'footer_center';
    $blockcls = '';
    $ospans = array();
    require( ThemeControlHelper::getLayoutPath( 'common/block-footcols.tpl' ) );
  ?>

  <?php
  /**
   * Footer Center Position
   * $ospans allow overrides width of columns base on thiers indexs. format array( column-index=>span number ), example array( 1=> 3 )[value from 1->12]
   */
  $blockid = 'footer_bottom';
  $blockcls = '';

  $ospans = array(1=>2,2=>2,3=>2,4=>2,5=>2,6=>2);
   require( ThemeControlHelper::getLayoutPath( 'common/block-footcols.tpl' ) );
  if( count($modules) <= 0 ) {
   ?>

  <div class="footer-bottom">
    <div class="container">
      <div class="inner">
        <div class="row">

        <?php if ($informations) { ?>
			<div class="column col-xs-12 col-sm-6 col-lg-2 col-md-2 escondermobi">
				<div class="box info">
					<div class="box-heading"><span><?php echo $text_information; ?></span></div>
					<div class="box-content">
						<ul class="list bullet text-fill">
						  <?php foreach ($informations as $information) { ?>
						  <li><a href="<?php echo $information['href']; ?>" data-hover="<?php echo $information['title']; ?>"><?php echo $information['title']; ?></a></li>
						  <?php } ?>
						</ul>
					</div>
				</div>
			</div>
			<?php } ?>

			<div class="column col-xs-12 col-sm-6 col-lg-2 col-md-2">
				<div class="box extra">
					<div class="box-heading"><span><?php echo $text_extra; ?></span></div>
					<div class="box-content">
						<ul class="list bullet text-fill">
							<li><a href="<?php echo $manufacturer; ?>" data-hover="<?php echo $text_manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
							<li><a href="<?php echo $voucher; ?>" data-hover="<?php echo $text_voucher; ?>"><?php echo $text_voucher; ?></a></li>
							<li><a href="<?php echo $affiliate; ?>" data-hover="<?php echo $text_affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
							<li><a href="<?php echo $special; ?>" data-hover="<?php echo $text_special; ?>"><?php echo $text_special; ?></a></li>
						</ul>
					</div>
				</div>
			</div>

			<div class="column col-xs-12 col-sm-6 col-lg-2 col-md-2 escondermobi">
				<div class="box">
					<div class="box-heading"><span><?php echo $text_account; ?></span></div>
					<div class="box-content">
						<ul class="list bullet text-fill">
							<li><a href="<?php echo $account; ?>" data-hover="<?php echo $text_account; ?>"><?php echo $text_account; ?></a></li>
							<li><a href="<?php echo $order; ?>" data-hover="<?php echo $text_order; ?>"><?php echo $text_order; ?></a></li>
							<li><a href="<?php echo $wishlist; ?>" data-hover="<?php echo $text_wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
							<li><a href="<?php echo $newsletter; ?>" data-hover="<?php echo $text_newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
						</ul>
					</div>
				</div>
			</div>

			<div class="column col-xs-12 col-sm-6 col-lg-2 col-md-2">
				<div class="box customer-service">
					<div class="box-heading"><span><?php echo $text_service; ?></span></div>
					<div class="box-content">
						<ul class="list bullet text-fill">
							<li><a href="<?php echo $contact; ?>" data-hover="<?php echo $text_contact; ?>"><?php echo $text_contact; ?></a></li>
							<li><a href="<?php echo $return; ?>" data-hover="<?php echo $text_return; ?>"><?php echo $text_return; ?></a></li>
							<li><a href="<?php echo $sitemap; ?>" data-hover="<?php echo $text_sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
							<li><a href="<?php echo $affiliate; ?>" data-hover="<?php echo $text_affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
						</ul>
					</div>
				</div>
			</div>

			<?php if( $content=$helper->getLangConfig('widget_toppage') ) {?>
			<div class="column col-xs-12 col-sm-6 col-lg-2 col-md-2 escondermobi">
				<?php echo $content; ?>
			</div>
			<?php } ?>


			<?php if( $content=$helper->getLangConfig('widget_ouroffers') ) {?>
			<div class="column col-xs-12 col-sm-6 col-lg-2 col-md-2">
				<?php echo $content; ?>
			</div>
			<?php } ?>

      </div>
    </div>
     </div> </div>
<?php  } ?>


  <?php
    $blockid = 'footer_bottom';
    $blockcls = '';
    $ospans = array();
    require( ThemeControlHelper::getLayoutPath( 'common/block-footcols.tpl' ) );
  ?>

</footer>



<div id="powered">
	<div class="container">
		<div class="inner">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div id="top"><a class="scrollup" href="#"><i class="fa fa-angle-up"></i>Top</a></div>
						<div class="copyright pull-left">
						<?php if( $helper->getConfig('enable_custom_copyright', 0) ) { ?>
							<?php echo $helper->getConfig('copyright'); ?>
						<?php } else { ?>
							<?php echo $powered; ?>.
						<?php } ?>
						Desenvolvido por <a href="http://www.fastwebsites.com.br" title="" target="_blank">Fast Websites</a>
						</div>

						<?php if( $content=$helper->getLangConfig('widget_paypal') ) {?>
						<div class="paypal pull-right">
							<?php echo $content; ?>
						</div>
						 <?php } ?>
					 </div>
			</div>
		</div>
	</div>
</div>
<?php if( $helper->getConfig('enable_paneltool',0) ){  ?>
  <?php  echo $helper->renderAddon( 'panel' );?>
<?php  } ?>

</div>
  <?php  echo $helper->renderAddon( 'offcanvas' );?>




</div>
</body></html>
