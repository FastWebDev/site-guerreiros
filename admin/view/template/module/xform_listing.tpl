<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right"><a href="<?php echo $add; ?>" data-toggle="tooltip" title="<?php echo $button_add; ?>" class="btn btn-primary"><i class="fa fa-plus"></i></a>
        <button type="button" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger" onclick="confirm('<?php echo $text_confirm; ?>') ? $('#form-forms').submit() : false;"><i class="fa fa-trash-o"></i></button>
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
        <h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $text_list; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-forms">
          <div class="table-responsive">
            <table class="table table-bordered table-hover">
              <thead>
                <tr>
                   <td style="width: 1px;" class="text-center"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></td>
                   <td class="text-left"><?php if ($sort == 'formName') { ?>
                    <a href="<?php echo $sort_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $text_form_name;?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_name; ?>"><?php echo $text_form_name;?></a>
                    <?php } ?></td>
                   <td class="text-right"><?php if ($sort == 'formCreationDate') { ?>
                    <a href="<?php echo $sort_date; ?>" class="<?php echo strtolower($order); ?>"><?php echo $text_create_on;?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_date; ?>"><?php echo $text_create_on;?></a>
                    <?php } ?></td>
                   <td class="text-left"><?php echo $text_status;?></td>
                   <td class="text-center"><?php echo $text_view_form;?></td>
                   <td class="text-right"><?php echo $text_view_record;?></td>
                   <td class="text-right"><?php echo $text_duplicate;?></td>
                   <td class="text-right"><?php echo $text_action;?></td>
                </tr>
              </thead>
              <tbody>
                <?php if ($forms) { ?>
                <?php foreach ($forms as $form) { ?>
                <tr>
                  <td class="text-center"><?php if (in_array($form['formId'], $selected)) { ?>
                    <input type="checkbox" name="selected[]" value="<?php echo $form['formId']; ?>" checked="checked" />
                    <?php } else { ?>
                    <input type="checkbox" name="selected[]" value="<?php echo $form['formId']; ?>" />
                    <?php } ?></td>
                  <td class="text-left"><?php echo $form['formName']; ?></td>
                  <td class="text-right"><?php echo $form['formCreationDate'];?></td>
                  <td class="text-left"><?php echo $form['status'];?></td>
                  <td class="text-center"><a href="<?php echo $form['form_url'];?>" target="_blank" data-toggle="tooltip" title="<?php echo $text_view_form; ?>" class="btn btn-info"><i class="fa fa-link"></i></a></td>
                  <td class="text-right"><a href="<?php echo $form['record']; ?>" data-toggle="tooltip" title="<?php echo $button_record; ?>" class="btn btn-primary"><i class="fa fa-eye"></i></a></td>
                  <td class="text-right"><a href="<?php echo $form['duplicate']; ?>" data-toggle="tooltip" title="<?php echo $button_duplicate; ?>" class="btn btn-primary"><i class="fa fa-copy "></i></a></td>
                  <td class="text-right"><a href="<?php echo $form['edit']; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i></a></td>
                </tr>
                <?php } ?>
                <?php } else { ?>
                <tr>
                  <td class="text-center" colspan="7"><?php echo $text_no_results; ?></td>
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
<?php echo $footer; ?>