<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right"><a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
      </div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <?php if ($success) { ?>
    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $text_view; ?></h3>
      </div>
      <div class="panel-body">
    
        <form action="<?php echo $cancel; ?>" method="post" enctype="multipart/form-data" id="form-information">
          <ul class="view-record">
                          <?php if($record) {?>
								 <?php foreach ($record as $label=>$value) {
									 ?>   
                                  <li>
                                    <label><?php echo $label ?></label>
                                    <span><?php echo $value;?></span>
                                  </li>
                              <?php }?>
                           <?php }?>
                        </ul>
        </form>
        
      </div>
    </div>
  </div>
</div>
<link rel="stylesheet" href="view/javascript/xform/xform.css" type="text/css" />
<?php echo $footer; ?>