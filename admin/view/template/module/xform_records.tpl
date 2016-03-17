<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="button" data-toggle="tooltip" title="<?php echo $button_setting; ?>" class="btn btn-primary btn-setting" ><i class="fa fa-cog"></i></button>
        <a href="javascript:void(0);" data-toggle="popover" data-trigger="focus" data-placement="bottom" data-html="true" title="<?php echo $button_csv; ?>" data-content="<a class='btn btn-info' href='<?php echo $export_csv.'&all=0'; ?>'><?php echo $text_export_current?></a>&nbsp;<a class='btn btn-info' href='<?php echo $export_csv.'&all=1'; ?>'><?php echo $text_export_all?></a>" class="btn btn-info"><i class="fa fa-file"></i></a>
        <a href="javascript:void(0);" data-toggle="popover" data-trigger="focus" data-placement="bottom" data-html="true" title="<?php echo $button_pdf; ?>" data-content="<a class='btn btn-info' href='<?php echo $export_pdf.'&all=0'; ?>'><?php echo $text_export_current?></a>&nbsp;<a class='btn btn-info' href='<?php echo $export_pdf.'&all=1'; ?>'><?php echo $text_export_all?></a>" class="btn btn-info"><i class="fa fa-file-pdf-o"></i></a>
        <button type="button" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger" onclick="confirm('<?php echo $text_confirm; ?>') ? $('#form-information').submit() : false;"><i class="fa fa-trash-o"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
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
        <h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $record_list; ?></h3>
      </div>
      <div class="panel-body">
        <div class="field-heading">
            <form action="<?php echo $save_heading; ?>" method="post">
                  <ul>
                  <?php foreach($fields as $field) {
					    $checked=array_key_exists($field['cid'],$formHeading)?'checked':'';
					  ?>
                     <li><label> <input <?php echo $checked;?> type="checkbox" name="formHeading[<?php echo $field['cid']?>]" id="" value="<?php echo $field['label']?>" />&nbsp;<?php echo $field['label'] ;?></label> </li>           
                   <?php }?>
         
                   </ul>
                     <input type="submit" class="btn btn-rounded btn-success save-setting" name="save_setting" value="<?php echo $text_save_heading;?>"  />
               </form>
           </div>
         <div class="well">
          <div class="row">
            <div class="col-sm-3">
                <div class="form-group">
                   <label class="control-label" for="input-keyword"><?php echo $entry_keyword; ?></label>
                    <input type="text" name="filter_keyword" value="<?php echo $filter_keyword; ?>" placeholder="<?php echo $entry_keyword; ?>" id="input-keyword" class="form-control" />
                </div>
            </div>
            <div class="col-sm-3">
                <div class="form-group">
                   <label class="control-label" for="input-store"><?php echo $entry_store; ?></label>
                    <select name="filter_store" id="input-store" class="form-control">
                       <?php foreach ($stores as $store) {
                         $filter_selected = ($store['store_id']==$filter_store)?'selected':'';
                        ?>
                         <option <?php echo $filter_selected;?> value="<?php echo $store['store_id']; ?>"><?php echo $store['name']; ?></option>
                       <?php }?>
                    </select>
                </div>
            </div>
            <div class="col-sm-3">
              <div class="form-group">
                <label class="control-label" for="input-start-date"><?php echo $entry_start_date; ?></label>
                <div class="input-group date">
                  <input type="text" name="filter_start_date" value="<?php echo $filter_start_date; ?>" placeholder="<?php echo $entry_start_date; ?>" data-date-format="YYYY-MM-DD" id="input-start-date" class="form-control" />
                  <span class="input-group-btn">
                  <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                  </span></div>
              </div>
            </div>  
            <div class="col-sm-3">  
              <div class="form-group">
                <label class="control-label" for="input-end-date"><?php echo $entry_end_date; ?></label>
                <div class="input-group date">
                  <input type="text" name="filter_end_date" value="<?php echo $filter_end_date; ?>" placeholder="<?php echo $entry_end_date; ?>" data-date-format="YYYY-MM-DD" id="input-end-date" class="form-control" />
                  <span class="input-group-btn">
                  <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                  </span></div>
              </div>
              <button type="button" id="button-filter" class="btn btn-primary pull-right"><i class="fa fa-search"></i> <?php echo $button_filter; ?></button>
            </div>
          </div>
        </div>   
        <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-information">
          <div class="table-responsive">
            <table class="table table-bordered table-hover">
              <thead>
                <tr>
                   <td style="width: 1px;" class="text-center"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></td>
                     <td class="text-left">ID</td>
                    <?php foreach($formHeading as $cid=>$label){?>
                      <td class="text-left"><?php echo $label; ?></td>
                    <?php }?>
                   <td class="text-right"><?php echo $text_action;?></td>
                </tr>
              </thead>
              <tbody>
                <?php if ($rows) { ?>
                <?php foreach ($rows as $row) { ?>
                <tr>
                  <td class="text-center"><?php if (in_array($row['recordId'], $selected)) { ?>
                    <input type="checkbox" name="selected[]" value="<?php echo $row['recordId']; ?>" checked="checked" />
                    <?php } else { ?>
                    <input type="checkbox" name="selected[]" value="<?php echo $row['recordId']; ?>" />
                    <?php } ?></td>
                  <td class="text-left"><?php echo $row['recordId']; ?></td>
                  <?php foreach($formHeading as $cid=>$label) { ?>
                           <td><?php echo isset($row[$cid])?$row[$cid]:'';?></td> 
                   <?php } ?>
                  <td class="text-right"><a href="<?php echo $row['view']; ?>" data-toggle="tooltip" title="<?php echo $button_view; ?>" class="btn btn-primary"><i class="fa fa-eye"></i></a> <a href="<?php echo $row['edit']; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i></a></td>
                </tr>
                <?php } ?>
                <?php } else { ?>
                <tr>
                  <td class="text-center" colspan="<?php echo count($formHeading)+3;?>"><?php echo $text_no_results; ?></td>
                </tr>
                <?php } ?>
              </tbody>
            </table>
          </div>
        </form>
        <div class="row">
          <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
          <div class="col-sm-6 text-right"><?php echo $results; ?></div>
        </div>
      </div>
    </div>
  </div>
</div>
<style type="text/css">
.field-heading{
  border: 1px solid #ddd;
    margin-bottom: 10px;
    padding: 10px;
	display:none;	
}
.field-heading li{
display:inline-block;
padding: 5px 8px;
}
.field-heading li label{ font-weight: normal;}
</style>
<script type="text/javascript"><!--
$('#button-filter').on('click', function() {
	url = 'index.php?route=module/xform/records&token=<?php echo $token; ?>&formId=<?php echo $formId;?>';
	
	var filter_store = $('input[name=\'filter_store\']').val();
	
	if (filter_store) {
		url += '&filter_store=' + encodeURIComponent(filter_store);
	}
	
	var filter_start_date = $('input[name=\'filter_start_date\']').val();
	
	if (filter_start_date) {
		url += '&filter_start_date=' + encodeURIComponent(filter_start_date);
	}
	
	var filter_end_date = $('input[name=\'filter_end_date\']').val();
	
	if (filter_end_date) {
		url += '&filter_end_date=' + encodeURIComponent(filter_end_date);
	}
	
	var filter_keyword = $('input[name=\'filter_keyword\']').val();
	
	if (filter_keyword) {
		url += '&filter_keyword=' + encodeURIComponent(filter_keyword);
	}
		
	location = url;
});
//--></script> 
<script type="text/javascript">
  $(document).ready(function() {
	   
		$('.btn-setting').click(function(e){
		   e.preventDefault();
		   if($('.field-heading').css('display')!='block'){
		     $('.field-heading').show(400);
		   }else{
			  $('.field-heading').hide(400);  
			}
	    });
		
	});
</script>
<script>
$(document).ready(function(){
    $('[data-toggle="popover"]').popover(); 
});
</script>
 <script src="view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
  <link href="view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css" type="text/css" rel="stylesheet" media="screen" />
  <script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});
//--></script>
<?php echo $footer; ?>