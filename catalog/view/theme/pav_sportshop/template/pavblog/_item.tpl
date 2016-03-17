<div class="blog-item box">
<h2 class="blog-title box-heading ">	<a href="<?php echo $blog['link'];?>" title="<?php echo $blog['title'];?>"><?php echo $blog['title'];?></a></h2>
		
<div class="box-content">

	<div class="blog-meta">
		<ul>
		<?php if( $config->get('cat_show_created') ) { ?>
		<li class="created">
			<span class="fa fa-time ">   <?php echo $objlang->get("text_created");?> :</span>
			<?php echo date("d-M-Y",strtotime($blog['created']));?>
		</li>
		<?php } ?>
		<?php if( $config->get('cat_show_author') ) { ?>
		<li class="author"><span class="fa fa-pencil">   <?php echo $objlang->get("text_write_by");?></span> <?php echo $blog['author'];?></li>
		<?php } ?>
		<?php if( $config->get('cat_show_category') ) { ?>
		<li class="publishin">
			<span class="fa fa-user">   <?php echo $objlang->get("text_published_in");?></span>
			<a class="t-color" href="<?php echo $blog['category_link'];?>" title="<?php echo $blog['category_title'];?>"><?php echo $blog['category_title'];?></a>
		</li>
		<?php } ?>
		
		<?php if( $config->get('cat_show_hits') ) { ?>
		<li class="hits"><span class="fa fa-eye-open">   <?php echo $objlang->get("text_hits");?></span> <?php echo $blog['hits'];?></li>
		<?php } ?>
		<?php if( $config->get('cat_show_comment_counter') ) { ?>
		<li class="comment_count"><span class="fa fa-comments">   <?php echo $objlang->get("text_comment_count");?></span> <?php echo $blog['comment_count'];?></li>
		<?php } ?>
		</ul>
	</div>
	<div class="image">
		<?php if( $blog['thumb'] && $config->get('cat_show_image') )  { ?>
		<img class="img-responsive" src="<?php echo $blog['thumb'];?>" title="<?php echo $blog['title'];?>" align=""/>
		<?php } ?>
	</div>

	<div class="blog-body">
		
	<?php if( $config->get('cat_show_title') ) { ?>
	<div class="blog-header clearfix">
	</div>
	<?php } ?>
		<?php if( $config->get('cat_show_description') ) {?>
		<div class="description">
			<?php echo $blog['description'];?>
		</div>
		<?php } ?>
		<?php if( $config->get('cat_show_readmore') ) { ?>
		<div class="blog-readmore"><a href="<?php echo $blog['link'];?>" class="button btn btn-default"><?php echo $objlang->get('text_readmore');?></a></div>
		<?php } ?>
	</div>	
</div>
</div>