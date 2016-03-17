<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
 <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-auspost" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <button type="submit" onclick="$('#savetype').val('continue');" form="form-auspost" data-toggle="tooltip" title="<?php echo $btn_save_continue; ?>" class="btn btn-info"><i class="fa fa-clipboard"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
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
            <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
          </div>
          <div class="panel-body">
           <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-auspost" class="form-horizontal">
                  <div class="form-info">
                           <ul class="nav nav-tabs" id="form-tab">
                              <li class="active"><a data-toggle="tab" href="#tab-info"><?php echo $text_form_info;?></a></li>
                              <li><a data-toggle="tab" href="#tab-option"><?php echo $text_form_option;?></a></li>
                              <li><a data-toggle="tab" href="#tab-integration"><?php echo $text_form_integration;?></a></li>
                              <li><a data-toggle="tab" href="#tab-translation"><?php echo $text_translation;?></a></li>
                              <li class="custom" <?php if($formdata['theme']!='custom') echo 'style="display:none;"';?>><a data-toggle="tab" href="#tab-custom"><?php echo $text_custom;?></a></li>
                              <li><a data-toggle="tab" href="#tab-other"><?php echo $tab_other;?></a></li>
                           </ul>   
                   
                    <div  class="tab-content">   
                      <div class="tab-pane active" id="tab-info"> 
                            <ul class="nav nav-tabs" id="language-core">
                              <?php $active_class=''; foreach ($languages as $language) { ?>
                                <li <?php if(!$active_class) echo 'class="active"'; $active_class='1'; ?>><a href="#language<?php echo $language['language_id']; ?>core" data-toggle="tab"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
                              <?php } ?>
                            </ul> 
                          <div class="tab-content lang-tab">  
                           <?php $active_class=''; foreach ($languages as $language) { ?>
                           <div class="tab-pane<?php if(!$active_class) echo ' active'; $active_class='1'; ?>" id="language<?php echo $language['language_id']; ?>core">                                   
                       		  <div class="form-group">
                            	<label class="col-sm-2 control-label" for="formName[<?php echo $language['language_id']; ?>"><?php echo $text_form_name;?></label>
                                <div class="col-sm-10">
                                 <input type="text" name="formDesc[<?php echo $language['language_id']; ?>][formName]" id="formName<?php echo $language['language_id']; ?>" value="<?php echo isset($formDesc[$language['language_id']]['formName']) ? $formDesc[$language['language_id']]['formName'] : 'untitled form'; ?>" class="form-control" />
                                </div>
                             </div>
                             <div class="form-group">
                                <label class="col-sm-2 control-label" for="formDescription<?php echo $language['language_id']; ?>"><?php echo $text_form_desc;?></label>
                                  <div class="col-sm-10">
                                   <textarea class="form-control" style="height:100px;" name="formDesc[<?php echo $language['language_id']; ?>][formDescription]" id="formDescription<?php echo $language['language_id']; ?>"><?php echo isset($formDesc[$language['language_id']]['formDescription']) ? $formDesc[$language['language_id']]['formDescription'] : ''; ?></textarea>
                                  </div>
                                </div>
                             </div> 
                           <?php } ?>
                           </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="formStatus"><?php echo $text_status?></label>
                            <div class="col-sm-10">
                                <select class="form-control" id="formStatus" name="status">
                                 <option value="1" <?php if($formdata['status']=='1') echo 'selected';?>><?php echo $text_status_active;?></option>
                                 <option  value="0" <?php if($formdata['status']=='0') echo 'selected';?>><?php echo $text_status_inactive;?></option>
                               </select>
                            </div>
                         </div>
                       </div>
                      <div class="tab-pane" id="tab-custom">
                          <p class="form-tips"> <i class="fa fa-question-circle"></i><?php echo $text_custom_tip;?></p>
                          <div class="form-group">
                           <label class="col-sm-2 control-label"><?php echo $text_custom_html?></label>
                           <div class="col-sm-10">
                              <textarea class="custom" name="custom"><?php echo $formdata['custom'];?></textarea>
                            </div>  
                          </div> 
                        </div>
                       <div class="tab-pane" id="tab-other">
                          <p class="form-tips"> <i class="fa fa-question-circle"></i><?php echo $text_custom_script_tip;?></p>
                          <div class="form-group">
                           <label class="col-sm-2 control-label"><?php echo $text_custom_script?></label>
                           <div class="col-sm-10">
                              <textarea class="custom" name="script"><?php echo $formdata['script'];?></textarea>
                            </div>  
                          </div> 
                          <p class="form-tips"> <i class="fa fa-question-circle"></i><?php echo $text_custom_style_tip;?></p>
                          <div class="form-group">
                           <label class="col-sm-2 control-label"><?php echo $text_custom_style?></label>
                           <div class="col-sm-10">
                              <textarea class="custom" name="style"><?php echo $formdata['style'];?></textarea>
                            </div>  
                          </div> 
                        </div> 
                       <div class="tab-pane" id="tab-integration">
                           <div class="form-group">
                            <label class="col-sm-2 control-label" for="formtheme"><?php echo $text_theme?></label>
                            <div class="col-sm-10">
                                <select class="form-control" id="theme" name="theme">
                                 <?php
                                   foreach($themes as $theme) {
                                 ?>
                                 <option value="<?php echo $theme;?>" <?php if($formdata['theme']==$theme) echo 'selected';?>><?php echo ucfirst($theme);?></option>
                                 <?php }?>
                               </select>
                            </div>
                         </div>
                    		<div class="form-group">
                           		 <label class="col-sm-2 control-label"><?php echo $text_form_url;?> </label>
                            	 <div class="col-sm-10">
                               		<a target="_blank" class="preview" href="<?php echo $form_url;?>"><?php echo $form_url;?></a>
                            	 </div>
                             </div>
                             <div class="form-group">
                           		 <label class="col-sm-2 control-label"><?php echo $text_form_seo_url;?> </label>
                            	 <div class="col-sm-10">
                               		<a target="_blank" class="preview" id="seo_preview" href="<?php echo HTTP_CATALOG.$formdata['keyword'];?>"><?php echo HTTP_CATALOG.$formdata['keyword'];?></a>
                            	 </div>
                             </div>
                            <div class="form-group">
                              <label class="col-sm-2 control-label" for="keyword"><?php echo $text_seo_keyword;?></label>
                              <div class="col-sm-10">
                                <input type="text" name="keyword" id="keyword" value="<?php echo $formdata['keyword']?>" class="form-control" />
                              </div>
                            </div>  
                            <div class="form-group">
                              <label class="col-sm-2 control-label" for="formModule"><?php echo $text_enable_mod;?></label>
                              <div class="col-sm-10">
                               <input class="form-control" <?php if($formdata['formModule']==1)echo 'checked';?> type="checkbox" name="formModule" value="1" id="formModule" />
                              </div>
                             </div>
                             <div class="form-group">
                              <label class="col-sm-2 control-label" for="customerOnly"><?php echo $text_available_logged_only;?></label>
                              <div class="col-sm-10">
                               <input class="form-control" <?php if($formdata['customerOnly']==1)echo 'checked';?> type="checkbox" name="customerOnly" value="1" id="customerOnly" />
                              </div>
                             </div>
                              
                            <div class="form-group">
                               <label class="col-sm-2 control-label" >&nbsp;</label>
                              <div class="col-sm-10">
                                 <p class="form-tips"><i class="fa fa-question-circle"></i> <?php echo $text_enable_mod_tip;?></p>
                               </div>  
                            </div> 
                            <?php if($text_shortcode) {?>
                             <div class="form-group">
                               <label class="col-sm-2 control-label" >&nbsp;</label>
                              <div class="col-sm-10">
                                 <p class="form-tips"><i class="fa fa-question-circle"></i> <?php echo $text_shortcode;?></p>
                               </div>  
                            </div> 
                            <?php } ?>
                       </div>
                        <div class="tab-pane" id="tab-translation">
                             <p class="form-tips"><i class="fa fa-question-circle"></i><?php echo $text_translation_tip;?></p>
                             <ul class="nav nav-tabs" id="language-heading">
                              <?php $active_class=''; foreach ($languages as $language) { ?>
                                <li <?php if(!$active_class) echo 'class="active"'; $active_class='1'; ?>><a href="#language<?php echo $language['language_id']; ?>heading" data-toggle="tab"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
                              <?php } ?>
                             </ul>
                             <div class="tab-content lang-tab">
                            
                             <?php $active_class=''; foreach ($languages as $language) { ?>
                              <div class="tab-pane<?php if(!$active_class) echo ' active'; $active_class='1'; ?>" id="language<?php echo $language['language_id']; ?>heading">                        
                                     <?php
                                       if($lang_labels[$language['language_id']]) {
                                     ?>
                                     <h3 class="lang-label"><?php echo $text_lang_label;?></h3>
                                     <?php } ?>
                                     <?php
                                     foreach($lang_labels[$language['language_id']] as $cid=>$label) {
                                     ?>
                                      <div class="form-group">
                                        <label class="col-sm-2">&nbsp;</label>
                                     	<div class="col-sm-10">
                                    		 <input class="form-control" name="labels[<?php echo $language['language_id']; ?>][<?php echo $cid;?>]" value="<?php echo $label;?>" />
                                     	</div>
                                      </div>
                                     <?php 
                                      }
                                     ?>
                                     
                                     <?php
                                       if($lang_guidelines[$language['language_id']]) {
                                     ?>
                                     <h3 class="lang-label"><?php echo $text_lang_guideline;?></h3>
                                     <?php } ?>
                                     
                                     <?php
                                     foreach($lang_guidelines[$language['language_id']] as $cid=>$value) {
                                     ?>
                                      <div class="form-group">
                                        <label class="col-sm-2">&nbsp;</label>
                                     	<div class="col-sm-10">
                                    		 <input class="form-control" name="guidelines[<?php echo $language['language_id']; ?>][<?php echo $cid; ?>]" value="<?php echo $value;?>" />
                                     	</div>
                                      </div>
                                     <?php 
                                      }
                                     ?>
                                     
                                     <?php
                                       if($lang_errors[$language['language_id']]) {
                                     ?>
                                     <h3 class="lang-label"><?php echo $text_lang_error;?></h3>
                                     <?php } ?>
                                     
                                     <?php
                                     foreach($lang_errors[$language['language_id']] as $cid=>$value) {
                                     ?>
                                      <div class="form-group">
                                        <label class="col-sm-2">&nbsp;</label>
                                     	<div class="col-sm-10">
                                    		 <input class="form-control" name="errors[<?php echo $language['language_id']; ?>][<?php echo $cid; ?>]" value="<?php echo $value;?>" />
                                     	</div>
                                      </div>
                                     <?php 
                                      }
                                     ?>
                                     
                                     <?php
                                       if($lang_options[$language['language_id']]) {
                                     ?>
                                     <h3 class="lang-label"><?php echo $text_lang_other;?></h3>
                                     <?php } ?>
                                     
                                     <?php
                                     foreach($lang_options[$language['language_id']] as $inc=>$value) {
                                     ?>
                                      <div class="form-group">
                                        <label class="col-sm-2">&nbsp;</label>
                                     	<div class="col-sm-10">
                                    		 <input class="form-control" name="options[<?php echo $language['language_id']; ?>][<?php echo $inc; ?>]" value="<?php echo $value;?>" />
                                     	</div>
                                      </div>
                                     <?php 
                                      }
                                     ?>
        
                               </div> 
                            <?php } ?>
                             </div>
                        </div>
                        <div class="tab-pane" id="tab-option">
                         <div class="form-group">
                            <label class="col-sm-2 control-label" for="successType"> <?php echo $text_hide_form_name;?>  </label>
                            <div class="col-sm-10">
                              <input name="hideTitle" value="1" <?php if($formdata['hideTitle']==1) echo 'checked';?> type="checkbox" class="form-control" />
                            </div>
                        </div>
                        <?php
                          $formdata['successType']=($formdata['successType'])?$formdata['successType']:'self';
						   ?> 
                          <div class="form-group">
                            <label class="col-sm-2 control-label" for="successType"><?php echo $text_success_page;?></label>
                             <div class="col-sm-10">
                              <select class="form-control successType" id="successType" name="successType">
                                 <option value="self" <?php if($formdata['successType']=='self') echo 'selected';?>><?php echo $text_show_success_msg;?></option>
                                 <option value="redirect" <?php if($formdata['successType']=='redirect') echo 'selected';?>><?php echo $text_success_url;?></option>
                               </select>
                             </div>  
                          </div>
                          <div class="form-group success-url" <?php if($formdata['successType']!='redirect') echo 'style="display:none;"';?> >
                            <label class="col-sm-2 control-label" for="successURL"><?php echo $text_redirect_url;?></label>
                            <div class="col-sm-10">
                              <input type="text" name="successURL" id="successURL" value="<?php echo $formdata['successURL']?>" class="form-control" />
                            </div>
                         </div>
                         <div class="form-group">
                            <label class="col-sm-2 control-label" for="sendAdminEmail"><?php echo $text_send_admin_email;?></label>
                            <div class="col-sm-10">
                               <input class="sendAdminEmail form-control" <?php if($formdata['sendAdminEmail']==1)echo 'checked';?> type="checkbox" name="sendAdminEmail" value="1" id="sendAdminEmail" />
                            </div>
                        </div> 
                        <div class="form-group admin-email" <?php if($formdata['sendAdminEmail']!=1)echo 'style="display:none;"';?> >
                            <label class="col-sm-2 control-label" for="adminEmail"><?php echo $text_enter_admin_email;?></label>
                            <div class="col-sm-10">
                              <input type="text" name="adminEmail" id="adminEmail" value="<?php echo $formdata['adminEmail']?>" class="form-control" />
                            </div>
                        </div>
                        <div class="form-group">
                          
                             <label class="col-sm-2 control-label" for="sendUserEmail"><?php echo $text_send_user_email;?> </label>
                             <div class="col-sm-10">
                               <input class="sendUserEmail form-control" <?php if($formdata['sendUserEmail']==1)echo 'checked';?> type="checkbox" name="sendUserEmail" value="1" id="sendUserEmail" />
                            </div>
                        </div> 
                        <div class="form-group user-email" <?php if($formdata['sendUserEmail']!=1)echo 'style="display:none;"';?> >
                            <label class="col-sm-2 control-label" for="userEmail"><span data-toggle="tooltip" title="<?php echo $text_user_email_tip;?>"><?php echo $text_enter_user_email;?> </span></label>
                            <div class="col-sm-10">
                               <select id="userEmail" name="userEmail">
                                <?php echo $email_fields;?>
                               </select>
                            </div>
                        </div> 
                        
                         <div class="form-group">
                          
                             <label class="col-sm-2 control-label" for="sendEmailAttachment"><?php echo $text_email_attached;?> </label>
                             <div class="col-sm-10">
                               <input class="sendEmailAttachment form-control" <?php if($formdata['sendEmailAttachment']==1)echo 'checked';?> type="checkbox" name="sendEmailAttachment" value="1" id="sendEmailAttachment" />
                            </div>
                        </div> 
                        <div class="form-group email-attachment" <?php if($formdata['sendEmailAttachment']!=1)echo 'style="display:none;"';?> >
                            <label class="col-sm-2 control-label" for="emailAttachmentType"><?php echo $text_email_attached_type;?> </label>
                            <div class="col-sm-10">
                               <select id="emailAttachmentType" name="emailAttachmentType">
                                  <option value="csv" <?php if($formdata['emailAttachmentType']=='csv')echo 'selected';?>><?php echo $text_email_attached_csv;?></option>
                                  <option value="pdf" <?php if($formdata['emailAttachmentType']=='pdf')echo 'selected';?>><?php echo $text_email_attached_pdf;?></option>
                               </select>
                            </div>
                        </div>
                        <div class="form-group email-attachment" <?php if($formdata['sendEmailAttachment']!=1)echo 'style="display:none;"';?> >
                            <label class="col-sm-2 control-label" for="emailAttachmentUser"><?php echo $text_email_send_type;?> </label>
                            <div class="col-sm-10">
                               <select id="emailAttachmentUser" name="emailAttachmentUser">
                                  <option value="user" <?php if($formdata['emailAttachmentUser']=='user')echo 'selected';?>><?php echo $text_email_send_type_user;?></option>
                                  <option value="admin" <?php if($formdata['emailAttachmentUser']=='admin')echo 'selected';?>><?php echo $text_email_send_type_admin;?></option>
                                  <option value="both" <?php if($formdata['emailAttachmentUser']=='both')echo 'selected';?>><?php echo $text_email_send_type_both;?></option>
                               </select>
                            </div>
                        </div>
                        <div class="email-lang">
                        <ul class="nav nav-tabs" id="language-other">
                              <?php $active_class=''; foreach ($languages as $language) { ?>
                                <li <?php if(!$active_class) echo 'class="active"'; $active_class='1'; ?>><a href="#language<?php echo $language['language_id']; ?>other" data-toggle="tab"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
                              <?php } ?>
                        </ul>
                        
                        <div class="tab-content lang-tab">
                            <?php $active_class=''; foreach ($languages as $language) { ?>
                            <div class="tab-pane<?php if(!$active_class) echo ' active'; $active_class='1'; ?>" id="language<?php echo $language['language_id']; ?>other">  
                        
                               <div class="form-group success-message" <?php if($formdata['successType']!='self') echo 'style="display:none;"';?>>
                                 <label class="col-sm-2 control-label" for="successMsg<?php echo $language['language_id']; ?>"><?php echo $text_success_msg;?></label>
                                 <div class="col-sm-10">
                                   <textarea class="form-control editor" style="height:100px;"  name="formDesc[<?php echo $language['language_id']; ?>][successMsg]" id="successMsg<?php echo $language['language_id']; ?>"><?php echo isset($formDesc[$language['language_id']]['successMsg']) ? $formDesc[$language['language_id']]['successMsg'] : ''; ?></textarea>
                                 </div>
                              </div>
                             <div class="form-group admin-email" <?php if($formdata['sendAdminEmail']!=1) echo 'style="display:none;"';?> >
                                <label class="col-sm-2 control-label" for="adminEmailSubject<?php echo $language['language_id']; ?>"><?php echo $text_admin_email_sub;?></label>
                                <div class="col-sm-10">
                                  <input type="text" name="formDesc[<?php echo $language['language_id']; ?>][adminEmailSubject]" id="adminEmailSubject<?php echo $language['language_id']; ?>" value="<?php echo isset($formDesc[$language['language_id']]['adminEmailSubject']) ? $formDesc[$language['language_id']]['adminEmailSubject'] : ''; ?>" class="form-control" />
                                </div>
                             </div>    
                            <div class="form-group admin-email" <?php if($formdata['sendAdminEmail']!=1) echo 'style="display:none;"';?> >
                               <label class="col-sm-2 control-label" for="adminEmailContent<?php echo $language['language_id']; ?>"><?php echo $text_admin_email_content;?></label>
                               <div class="col-sm-10">
                                 <textarea class="form-control editor" name="formDesc[<?php echo $language['language_id']; ?>][adminEmailContent]" id="adminEmailContent<?php echo $language['language_id']; ?>"><?php echo isset($formDesc[$language['language_id']]['adminEmailContent']) ? $formDesc[$language['language_id']]['adminEmailContent'] : ''; ?></textarea>
                               </div>
                            </div> 
                             <div class="form-group user-email" <?php if($formdata['sendUserEmail']!=1) echo 'style="display:none;"';?> >
                                <label class="col-sm-2 control-label" for="userEmailSubject<?php echo $language['language_id']; ?>"><?php echo $text_user_email_sub;?></label>
                                <div class="col-sm-10">
                                  <input type="text" name="formDesc[<?php echo $language['language_id']; ?>][userEmailSubject]" id="userEmailSubject<?php echo $language['language_id']; ?>" value="<?php echo isset($formDesc[$language['language_id']]['userEmailSubject']) ? $formDesc[$language['language_id']]['userEmailSubject'] : ''; ?>" class="form-control" />
                                </div>
                            </div>   
                            <div class="form-group user-email" <?php if($formdata['sendUserEmail']!=1) echo 'style="display:none;"';?> >
                               <label class="col-sm-2 control-label" for="userEmailContent<?php echo $language['language_id']; ?>"><?php echo $text_user_email_content;?></label>
                               <div class="col-sm-10">
                                 <textarea class="form-control editor" name="formDesc[<?php echo $language['language_id']; ?>][userEmailContent]" id="userEmailContent<?php echo $language['language_id']; ?>"><?php echo isset($formDesc[$language['language_id']]['userEmailContent']) ? $formDesc[$language['language_id']]['userEmailContent'] : ''; ?></textarea>
                               </div>
                            </div> 
                          </div>
                           <?php }?>
                        </div>
                        </div>
                       </div>
                        
                    </div>  <!--End of tab content info--> 
                   </div> <!--End of form info-->    
                  
                  <div class='fb-main'></div> 
                     
                    
                    <input type="hidden" id="formId" name="formId" value="<?php echo $data['formId']?>" />
                    <input type="hidden" id="savetype" name="save" value="save" />
                    <input type="hidden" name="formdata" id="formdata" value="<?php echo htmlspecialchars(json_encode(array("fields"=>$data['formfields']))); ?>" />    
           </form>
      </div>
    </div>
  </div>
  
   <!--Start of form keyword --> 
                    <div class="form-keywords">
                             <div class="heading">
                               <?php echo $text_email_keywords;?>
                               <abbr><?php echo $tip_keyword;?></abbr>  
                               <a href="#" class="resize"><i class="fa fa-minus"></i></a> 
                             </div>
                             <div class="keywords-container">
                               <div class="table-responsive">
                               		<table class="table table-striped table-bordered table-hover">
                                  		<thead>
                                  		  <tr>
                                  		    <td class="text-left"><?php echo $text_keyword_name?></td>
                                  		    <td class="text-left"><?php echo $text_keyword_label?></td>
                                  		    <td class="text-left email-keyword"><?php echo $text_keyword_value?></td>
                                  		    <td class="text-left template-keyword"><?php echo $text_keyword_field?></td>
                                  		    <td class="text-left template-keyword"><?php echo $text_keyword_info?></td>
                                  		    <td class="text-left template-keyword"><?php echo $text_keyword_error?></td>
                                  		  </tr>
                                  		</thead>
                                  		<tbody>
                                  		   <tr class="email-keyword">
                                  		    <td class="text-left"><?php echo $text_form_name?></td>
                                  		    <td class="text-left">-</td>
                                  		    <td class="text-left"><textarea readonly="readonly">{formName}</textarea></td>
                                  		    <td class="text-left template-keyword">-</td>
                                  		    <td class="text-left template-keyword">-</td>
                                  		    <td class="text-left template-keyword">-</td>
                                  		  </tr>
                                  		  <tr class="email-keyword">
                                  		    <td class="text-left"><?php echo $text_record_id?></td>
                                  		    <td class="text-left">-</td>
                                  		    <td class="text-left"><textarea readonly="readonly">{recordId}</textarea></td>
                                  		    <td class="text-left template-keyword">-</td>
                                  		    <td class="text-left template-keyword">-</td>
                                  		    <td class="text-left template-keyword">-</td>
                                  		  </tr>
                                  		  <tr class="email-keyword">
                                  		    <td class="text-left"><?php echo $text_keyword_ip?></td>
                                  		    <td class="text-left">-</td>
                                  		    <td class="text-left"><textarea readonly="readonly">{userIP}</textarea></td>
                                  		    <td class="text-left template-keyword">-</td>
                                  		    <td class="text-left template-keyword">-</td>
                                  		    <td class="text-left template-keyword">-</td>
                                  		  </tr>
                                  		  <tr class="email-keyword">
                                  		    <td class="text-left"><?php echo $text_keyword_date?></td>
                                  		    <td class="text-left">-</td>
                                  		    <td class="text-left"><textarea readonly="readonly">{submitDate}</textarea></td>
                                  		    <td class="text-left template-keyword">-</td>
                                  		    <td class="text-left template-keyword">-</td>
                                  		    <td class="text-left template-keyword">-</td>
                                  		  </tr>
                                  		  <tr class="email-keyword">
                                  		    <td class="text-left"><?php echo $text_keyword_date_time?></td>
                                  		    <td class="text-left">-</td>
                                  		    <td class="text-left"><textarea readonly="readonly">{submitDateTime}</textarea></td>
                                  		    <td class="text-left template-keyword">-</td>
                                  		    <td class="text-left template-keyword">-</td>
                                  		    <td class="text-left template-keyword">-</td>
                                  		  </tr>
                                  		  <tr class="email-keyword">
                                  		    <td class="text-left"><?php echo $text_keyword_url?></td>
                                  		    <td class="text-left">-</td>
                                  		    <td class="text-left"><textarea readonly="readonly">{siteURL}</textarea></td>
                                  		    <td class="text-left template-keyword">-</td>
                                  		    <td class="text-left template-keyword">-</td>
                                  		    <td class="text-left template-keyword">-</td>
                                  		  </tr>
                                  		  <tr class="email-keyword">
                                  		    <td class="text-left"><?php echo $text_store_name?></td>
                                  		    <td class="text-left">-</td>
                                  		    <td class="text-left"><textarea readonly="readonly">{storeName}</textarea></td>
                                  		    <td class="text-left template-keyword">-</td>
                                  		    <td class="text-left template-keyword">-</td>
                                  		    <td class="text-left template-keyword">-</td>
                                  		  </tr>
                                  		  <tr class="email-keyword">
                                  		    <td class="text-left"><?php echo $text_product_id?></td>
                                  		    <td class="text-left"><?php echo $text_product_tip;?></td>
                                  		    <td class="text-left"><textarea readonly="readonly">{productID}</textarea></td>
                                  		    <td class="text-left template-keyword">-</td>
                                  		    <td class="text-left template-keyword">-</td>
                                  		    <td class="text-left template-keyword">-</td>
                                  		  </tr>
                                  		  <tr class="email-keyword">
                                  		    <td class="text-left"><?php echo $text_product_name?></td>
                                  		    <td class="text-left"><?php echo $text_product_tip;?></td>
                                  		    <td class="text-left"><textarea readonly="readonly">{productName}</textarea></td>
                                  		    <td class="text-left template-keyword">-</td>
                                  		    <td class="text-left template-keyword">-</td>
                                  		    <td class="text-left template-keyword">-</td>
                                  		  </tr>
                                  		  <?php 
                                  		    foreach($email_kewords as $email_keword) {
                                  		   ?>
                                  		  <tr>
                                  		    <td class="text-left"><?php echo $email_keword['title'];?></td>
                                  		    <td class="text-left"><textarea readonly="readonly"><?php echo $email_keword['label'];?></textarea></td>
                                  		    <td class="text-left email-keyword"><textarea readonly="readonly"><?php echo $email_keword['value'];?></textarea></td>
                                  		    <td class="text-left template-keyword"><textarea readonly="readonly"><?php echo $email_keword['element'];?></textarea></td>
                                  		    <td class="text-left template-keyword"><textarea readonly="readonly"><?php echo $email_keword['info'];?></textarea></td>
                                  		    <td class="text-left template-keyword"><textarea readonly="readonly"><?php echo $email_keword['error'];?></textarea></td>
                                  		  </tr>
                                  		  <?php  
                                  		    }
                                  		  ?>
                                  		</tbody>
                               		</table>
                               </div>		
                             </div>
                          </div> 
     <!--End of form keyword -->   

<style type="text/css">
    .form-info {
    	background: none repeat scroll 0 0 #f9f9f9;
    	border: 1px solid #d7d7d7;
    	border-radius: 6px;
    	margin: 10px auto 20px;
    	width: 96%;
    }
    .fbform p{ clear:none !important;}
	.info-block {
    	font-size: 11px;
    	margin-left: 15px;
    }
	#tab-option {
    	position: relative;
    }
	div.form-keywords {
    	background: none repeat scroll 0 0 #f2f2f2;
    	border: 1px solid #545454;
    	border-radius: 4px;
    	box-shadow: 1px 2px 6px #dad8d8;
    	padding: 0;
    	display: none;
        bottom: 0;
        right: 60px;
		position:fixed;
		z-index: 1000
    }
   div.form-keywords div.heading {
     	background: none repeat scroll 0 0 #545454;
    	color: #fff;
    	font-weight: bold;
    	text-transform: uppercase;
		padding: 8px;
		position: relative;
		cursor:pointer;
   } 
  div.form-keywords div.heading abbr{  
   	 font-size: 10px;
  	 display: block;
  	 text-transform: initial;
  	 font-weight: normal;
  }
  
  div.form-keywords div.heading a.resize{
    position: absolute;
    right: 18px;
    top: 18px;
    font-size:15px;
    color: #fff;
  }
  .minimize .heading .resize {
    display: none;
  }
  .minimize .keywords-container {
  display: none;
  }
   
   div.form-keywords .keywords-container {
     max-height: 250px;
     overflow: scroll;
   }
  
  div.form-keywords textarea { 
    border:1px solid #FDFDFD;
  	background-color: #FDFDFD;
  	resize: none;
  	height: 23px;
  	margin: 0;
  	outline: 0;
  	vertical-align: middle;
  	padding: 3px;
  	cursor: pointer;
  }
  div.form-keywords textarea:hover{
   outline:0;
   border:1px solid #88A1B8;
  }
  
  a.preview{
       display: inline-block;
       margin-top: 7px; 
  }
  
 .translation-wrapper {
  text-align: center;
  padding-top: 10px;
  padding-bottom: 17px;
 }
    
 #tab-custom textarea{
    width: 95%;
    height: 400px;
  }
#tab-other textarea {
    width: 95%;
    height: 200px;
  }
  .form-tips {
    background-color: #FFF;
    border: 8px;
    width: 90%;
    margin: 0 auto;
    margin-bottom: 11px;
    padding: 10px;
    border-radius: 5px;
    color: #575555;
    border: 1px solid #BDBDBD;
    padding-left: 40px;
    position: relative;
  }
 .form-tips i {
  font-size: 25px;
  position: absolute;
  left: 6px;
  top: 5px;
  }
  .lang-label{margin-left: 50px;} 
  .lang-tab .form-group { margin-left: 0 !important; margin-right: 0 !important;}
  .email-lang{ width: 98%;
    margin: 0 auto;
    border: 1px solid #E2DCDC;
    padding: 10px;
 }   
</style>
<script src="view/javascript/xform/v.js"></script>
<script src="view/javascript/xform/fb.js"></script> 
<link type="text/css" rel="stylesheet" media="screen" href="view/javascript/xform/fb.css" />
<script>
    $(function(){
      fb = new Formbuilder({
        selector: '.fb-main',
		 onAjaxSubmit:function(){
		   return {'formId':$('#formId').val(),'userEmail':$('#userEmail').val()};
		 },
		 onAjaxComplete:function(data){
		  $('#formId').val(data.formId);	 
		  $('#userEmail').html(data.emails); 
		 },
		 <?php if($formfields){?>bootstrapData: <?php echo json_encode($formfields); ?>,<?php } ?> 
		 end_point:'index.php?route=module/xform/quick_save&token=<?php echo $token; ?>'
        
      });
     
      fb.on('save', function(payload){
         $('#formdata').val(payload);
      });
      
      
      $('.editor').summernote({height: 300});
      
      
    });

  </script>
  
  <script type="text/javascript">
    $(document).ready(function () {		
	 
		$('#keyword').keyup(function(){
		   $('#seo_preview').html('<?php echo HTTP_CATALOG;?>'+$(this).val()).attr('href','<?php echo HTTP_CATALOG;?>'+$(this).val());
		});
		
		$('#form-tab a').click(function() {
		
		  
		  if( $(this).attr('href').indexOf('option') !=-1) {
		     $('.template-keyword').hide();
		     $('.email-keyword').show();
		     //$('div.form-keywords').show(400);
		     
		     if($('.sendUserEmail').prop('checked') || $('.sendAdminEmail').prop('checked')) {
			      $('div.form-keywords').show(400);
			  }
		     
		  }
		  else if( $(this).attr('href').indexOf('custom') !=-1) {
		     $('.email-keyword').hide();
		     $('.template-keyword').show();
		     $('div.form-keywords').show(400);
		  }
		   else {
		      $('div.form-keywords').hide(400);
		  }
		
		});
		
		$('div.heading a.resize').click(function(e){
		   e.preventDefault();
		   e.stopPropagation();
		   $('div.form-keywords').addClass('minimize');
		});
		
		$('div.heading').click(function(e){
		    e.preventDefault();
		    e.stopPropagation();
		    $('div.form-keywords').removeClass('minimize');
		});
		
		$('div.heading').dblclick(function(e){
		   e.preventDefault();
		   e.stopPropagation();
		   $('div.form-keywords').addClass('minimize');
		});
		
		$('#theme').change(function(){
		
		     if( $(this).val()=='custom' ) {
		       $('li.custom').show();
		     } else {
		       $('li.custom').hide();
		     
		     }
		});
		
		$('.sendAdminEmail').click(function(){
			 if($(this).prop('checked')){
			   $('div.admin-email').show(400);	 
			   $('div.form-keywords').show(400);
		    }else{
			 $('div.admin-email').hide(400);
			 
			 if(!$('.sendUserEmail').prop('checked')) {
			      $('div.form-keywords').hide(400);
			  }	 	
		   }
	   });
	   
	   $('.sendUserEmail').click(function(){
			 if($(this).prop('checked')){
			   $('div.user-email').show(400);
			   $('div.form-keywords').show(400);	 
		    } else{
			   $('div.user-email').hide(400);	
			   
			    if(!$('.sendAdminEmail').prop('checked')) {
			      $('div.form-keywords').hide(400);
			    }	
		    }
		  
	   });
	   
	   $('.sendEmailAttachment').click(function(){
			 if($(this).prop('checked')){
			   $('div.email-attachment').show(400); 
		    } else{
			   $('div.email-attachment').hide(400); 
		    }
		  
	   });
	   
	   
		
	   
	   $('.successType').change(function(){
		   
			 if($(this).val()=='self'){
			      $('div.success-message').show(400);	
				  $('div.success-url').hide(400);	  
		    }else{
				  $('div.success-message').hide(400);	
			      $('div.success-url').show(400); 	 	
		    }
	   });
	   
	   $('div.form-keywords textarea').on('click',function() {
		  $(this).select();
	   });
  });	   
	
  </script>	 
</div>
<?php echo $footer; ?>