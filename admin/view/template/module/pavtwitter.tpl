<?php echo $header; ?><?php echo $column_left; ?>

<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <a class="btn btn-primary" onclick="$('#form').submit();"><?php echo $button_save; ?></a>
        <a class="btn btn-success" onclick="$('#action-mode').val('save_stay');$('#form').submit();"><?php echo $button_save_edit; ?></a>
        <a class="btn btn-danger" href="<?php echo $cancel; ?>"><?php echo $button_cancel; ?></a>
      </div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div><!-- End div#page-header -->
  <div id="page-content" class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>

    <?php if (isset($success) && !empty($success)) { ?>
    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>

    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $subheading; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form" class="form-horizontal">

          <input type="hidden" name="action_mode" id="action-mode" value=""/>
          <input type="hidden" name="pavtwitter_module[action]" id="action" value=""/>
           <!-- Nav tabs -->
                <div class="row">
                  <ul class="nav nav-tabs" role="tablist">
                    <li <?php if( $selectedid ==0 ) { ?>class="active" <?php } ?>> <a href="<?php echo $link; ?>"> <span class="fa fa-plus"></span> <?php echo $olang->get('button_module_add');?></a></li>
                    <?php $i=1; foreach( $moduletabs as $key => $module ){ ?>
                    <li role="presentation" <?php if( $module['module_id']==$selectedid ) {?>class="active"<?php } ?>>
                      <a href="<?php echo $link; ?>&module_id=<?php echo $module['module_id']?>" aria-controls="bannermodule-<?php echo $key; ?>"  >
                        <span class="fa fa-pencil"></span> <?php echo $module['name']?>
                       </a>
                      </li>
                    <?php $i++ ;} ?>
                  
                  </ul>
                </div>
                <!-- Tab panes -->

          <div class="row">
            <div class="col-sm-12">
            <div >
      <?php $module_row = 1; ?>
      <?php foreach ($modules as $module) { ?>
      <?php if( $selectedid ){ ?>
               <div class="pull-right">
                      <a href="<?php echo $action;?>&delete=1" class="remove btn btn-danger" ><span><i class="fa fa-remove"></i> Delete This</span></a>
                    </div>  
                    <?php } ?>
                  <div  id="tab-module<?php echo $module_row; ?>">
                      <table class="table table-bordered">
                        <tr>
                          <td class="col-sm-2"><?php echo $objlang->get('entry_name'); ?></td>
                          <td class="col-sm-10"><input class="form-control" style="width:55%;" name="pavtwitter_module[<?php echo $module_row; ?>][name]" value="<?php echo isset($module['name'])?$module['name']:''; ?>"/></td>
                        </tr>
                        <tr>
                            <td class="col-sm-2"><?php echo $objlang->get('entry_status'); ?></td>
                            <td class="col-sm-10"><select name="pavtwitter_module[<?php echo $module_row; ?>][status]" class="form-control" style="width:10%;">
                              <?php if ( isset($module['status']) && $module['status'] ) { ?>
                              <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                              <option value="0"><?php echo $text_disabled; ?></option>
                              <?php } else { ?>
                              <option value="1"><?php echo $text_enabled; ?></option>
                              <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                              <?php } ?>
                            </select></td>
                          </tr>

                        <tr>
                          <td class="col-md-2"><?php echo $entry_widgetid; ?></td>   
                          <td class="col-md-10"><input type="text" name="pavtwitter_module[<?php echo $module_row; ?>][widget_id]" value="<?php echo isset($module['widget_id'])?$module['widget_id']:''; ?>" size="35" class="form-control" style="width:55%;" /><br/><p><?php echo $entry_widget_help; ?></p></td> 
                        </tr>

                        <tr>
                          <td class="col-md-2"><?php echo $entry_limit; ?></td>   
                          <td class="col-md-10"><input type="text" name="pavtwitter_module[<?php echo $module_row; ?>][count]" value="<?php echo $module['count']; ?>" class="form-control" style="width:55%;" /><br/>
                            <p><?php echo $entry_count_help; ?></p></td> 
                        </tr>

                         <tr>
                          <td class="col-md-2"><?php echo $entry_username; ?></td>   
                          <td class="col-md-10"><input type="text" name="pavtwitter_module[<?php echo $module_row; ?>][username]" value="<?php echo $module['username']; ?>" class="form-control" style="width:55%;" /></td> 
                        </tr>

                        <tr>
                          <td class="col-md-2"><?php echo $entry_theme; ?></td>   
                          <td class="col-md-10"><select name="pavtwitter_module[<?php echo $module_row; ?>][theme]" class="form-control" style="width:15%;">
                              <?php foreach($themes as $theme):?>
                                <?php if(isset($module['theme']) && $module['theme'] == $theme):?>
                                  <option value="<?php echo $theme; ?>" selected="selected"><?php echo $theme; ?></option>
                              <?php else: ?>
                                  <option value="<?php echo $theme; ?>"><?php echo $theme; ?></option>
                               <?php endif;?>
                              <?php endforeach; ?>
                          </select></td> 
                        </tr>

                        <tr>
                          <td class="col-md-2"><?php echo $entry_nickname_color; ?></td>   
                          <td class="col-md-10"><input type="text" class="color" name="pavtwitter_module[<?php echo $module_row; ?>][nickname_color]" value="<?php echo isset($module['nickname_color'])?$module['nickname_color']:'#000000' ?>" style="width:55%;" /></td> 
                        </tr>

                        <tr>
                          <td class="col-md-2"><?php echo $entry_name_color; ?></td>   
                          <td class="col-md-10"><input type="text" class="color" name="pavtwitter_module[<?php echo $module_row; ?>][name_color]" value="<?php echo isset($module['nickname_color'])?$module['name_color']:'#000000' ?>" style="width:55%;" /></td> 
                        </tr>

                        <tr>
                          <td class="col-md-2"><?php echo $entry_title_color; ?></td>   
                          <td class="col-md-10"><input type="text" class="color" name="pavtwitter_module[<?php echo $module_row; ?>][title_color]" value="<?php echo isset($module['nickname_color'])?$module['title_color']:'#000000' ?>" style="width:55%;" /></td> 
                        </tr>

                        <tr>
                          <td class="col-md-2"><?php echo $entry_linkcolor; ?></td>   
                          <td class="col-md-10"><input type="text" class="color" name="pavtwitter_module[<?php echo $module_row; ?>][link_color]" value="<?php echo $module['link_color']; ?>" style="width:55%;"/></td> 
                        </tr>

                        <tr>
                          <td class="col-md-2"><?php echo $entry_bordercolor; ?></td>   
                          <td class="col-md-10"><input type="text" class="color" name="pavtwitter_module[<?php echo $module_row; ?>][border_color]" value="<?php echo $module['border_color']; ?>" style="width:55%;" /></td> 
                        </tr>

                        <tr>
                          <td class="col-md-2"><?php echo $entry_width; ?></td>   
                          <td class="col-md-10"><input type="text" name="pavtwitter_module[<?php echo $module_row; ?>][width]" value="<?php echo isset($module['width'])?$module['width']:''; ?>" class="form-control" style="width:55%;" /></td> 
                        </tr>

                        <tr>
                          <td class="col-md-2"><?php echo $entry_height; ?></td>   
                          <td class="col-md-10"><input type="text" name="pavtwitter_module[<?php echo $module_row; ?>][height]" value="<?php echo isset($module['height'])?$module['height']:''; ?>" class="form-control" style="width:55%;" /></td> 
                        </tr>

                        <tr>
                          <td class="col-md-2"><?php echo $entry_showreply; ?></td>   
                          <td class="col-md-10"><select name="pavtwitter_module[<?php echo $module_row; ?>][show_replies]" class="form-control" style="width:15%;">
                          <?php if ($module['show_replies']) { ?>
                          <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                          <option value="0"><?php echo $text_disabled; ?></option>
                          <?php } else { ?>
                          <option value="1"><?php echo $text_enabled; ?></option>
                          <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                          <?php } ?>
                          </select></td> 
                        </tr>

                        <tr>
                          <td class="col-md-2"><?php echo $entry_chrome; ?></td>   
                          <td class="col-md-10"><select name="pavtwitter_module[<?php echo $module_row; ?>][chrome][]" multiple="multiple" class="form-control" style="width:15%;">
                              <?php foreach($chromes as $chrome):?>
                                <?php if(isset($module['chrome']) && is_array($module['chrome']) && in_array($chrome, $module['chrome'])):?>
                                  <option value="<?php echo $chrome; ?>" selected="selected"><?php echo $chrome; ?></option>
                              <?php else: ?>
                                  <option value="<?php echo $chrome; ?>"><?php echo $chrome; ?></option>
                               <?php endif;?>
                              <?php endforeach; ?>
                          </select><br/><p><?php echo $entry_chrome_help; ?></p></td> 
                        </tr>
                      </table>
                      <!-- End table config module -->
                    </div>
                  </div>
                <?php $module_row++; ?>
                <?php } ?>
              </div> <!-- End tab content -->
            </div>
          </div>

        </form>
      </div>
    </div>  <!-- End panel -->

  </div> <!-- End page content -->
</div> <!-- End content -->

<script type="text/javascript">
var module_row = <?php echo $module_row; ?>;
$('.colorbox').colorbox({
    overlayClose: true,
    opacity: 0.5,
    rel: "colorbox"
  });

<script type="text/javascript">
$('#module li:first-child a').tab('show');
<?php $module_row = 1; ?>
<?php foreach ($modules as $module) { ?>
$('#language<?php echo $module_row; ?> li:first-child a').tab('show');
<?php $module_row++; ?>
<?php } ?>
</script>

<?php echo $footer; ?>