<script type="text/javascript" src="catalog/view/theme/default/template/xform/jquery.autocomplete.js"></script>
<script type="text/javascript" src="catalog/view/theme/default/template/xform/countries.js"></script>
<script type="text/javascript" src="catalog/view/theme/default/template/xform/demo.js"></script>
<script type="text/javascript" src="catalog/view/theme/default/template/xform/jquery-1.8.2.min.js"></script>
<link href="catalog/view/theme/default/template/xform/styles.css" rel="stylesheet" />



<?php echo $header; ?>
<style>
.form-wrapper .form-ul li .address-wrapper .address-line {
    margin-bottom: 9px;
    display: inline-flex;
}
.form-wrapper .form-ul li .address-wrapper input.street {
    width: 740px !important;
    position: absolute;
    margin-top: 21px;
}
.form-wrapper .form-ul li .address-wrapper input.city {
    width: 31%;
    margin-left: 375px;
    margin-top: -1px;
}
.form-wrapper .form-ul li .address-wrapper input.state {
    margin-left: 10px;
    width: 31%;
    margin-top: -1px;
}
.form-wrapper .form-ul li .address-wrapper input.zip {
    width: 300px;
    position: absolute;
    margin-top: -43px;
}

.form-wrapper .form-ul li .address-wrapper select.country {
    margin-left: 0px !important;
    width: 31%;
    margin-top: 50px;
}
</style>


<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php	for($i=1;$i < 7; $i++){?>
  <style>
  input#field-c42-<?php echo "$i";?>{
      height: 20px;
      width: 20px;
      padding-top: 0px;
      padding-left: 0px;
      display: inline-flex;
      align-items: baseline;
    }
  </style>
  <?php } ?>
  <?php	for($i=1;$i < 7; $i++){?>
  <style>
  input#field-c45-<?php echo "$i";?>{
      height: 20px;
      width: 20px;
      padding-top: 0px;
      padding-left: 0px;
      display: inline-flex;
      align-items: baseline;
    }
  </style>
  <?php } ?>
  <?php	for($i=1;$i < 6; $i++){?>
  <style>
  input#field-c50-<?php echo "$i";?>{
      height: 20px;
      width: 20px;
      padding-top: 0px;
      padding-left: 0px;
      display: inline-flex;
      align-items: baseline;
    }
  </style>
  <?php } ?>

  <!-- CADASTRO  INVESTIDOR-->
  <?php	for($i=1;$i < 8; $i++){?>
  <style>
  input#field-c22-<?php echo "$i";?>{
      height: 20px;
      width: 20px;
      padding-top: 0px;
      padding-left: 0px;
      display: inline-flex;
      align-items: baseline;
    }
  </style>
  <?php } ?>
  <?php	for($i=1;$i < 6; $i++){?>
  <style>
  input#field-c57-<?php echo "$i";?>{
      height: 20px;
      width: 20px;
      padding-top: 0px;
      padding-left: 0px;
      display: inline-flex;
      align-items: baseline;
    }
  </style>
  <?php } ?>
  <?php	for($i=1;$i < 7; $i++){?>
  <style>
  input#field-c58-<?php echo "$i";?>{
      height: 20px;
      width: 20px;
      padding-top: 0px;
      padding-left: 0px;
      display: inline-flex;
      align-items: baseline;
    }
  </style>
  <?php } ?>
  <?php	for($i=1;$i < 5; $i++){?>
  <style>
  input#field-c62-<?php echo "$i";?>{
      height: 20px;
      width: 20px;
      padding-top: 0px;
      padding-left: 0px;
      display: inline-flex;
      align-items: baseline;
    }
  </style>
  <?php } ?>
<!--cadastro time-->

<?php	for($i=1;$i < 7; $i++){?>
<style>
input#field-c87-<?php echo "$i";?>{
    height: 20px;
    width: 20px;
    padding-top: 0px;
    padding-left: 0px;
    display: inline-flex;
    align-items: baseline;
  }
</style>
<?php } ?>

<?php	for($i=1;$i < 7; $i++){?>
<style>
input#field-c113-<?php echo "$i";?>{
    height: 20px;
    width: 20px;
    padding-top: 0px;
    padding-left: 0px;
    display: inline-flex;
    align-items: baseline;
  }
</style>
<?php } ?>

<?php	for($i=1;$i < 7; $i++){?>
<style>
input#field-c123-<?php echo "$i";?>{
    height: 20px;
    width: 20px;
    padding-top: 0px;
    padding-left: 0px;
    display: inline-flex;
    align-items: baseline;
  }
</style>
<?php } ?>

<?php	for($i=1;$i < 10; $i++){?>
<style>
input#field-c161-<?php echo "$i";?>{
    height: 20px;
    width: 20px;
    padding-top: 0px;
    padding-left: 0px;
    display: inline-flex;
    align-items: baseline;
  }
</style>
<?php } ?>
<?php	for($i=1;$i < 9; $i++){?>
<style>
input#field-c185-<?php echo "$i";?>{
    height: 20px;
    width: 20px;
    padding-top: 0px;
    padding-left: 0px;
    display: inline-flex;
    align-items: baseline;
  }
</style>
<?php } ?>

  <div id="selection"></div>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <?php echo $form; ?><?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>

<script type="text/javascript">
jQuery(document).ready(function(){
    jQuery(".street").attr("placeholder", "Logradouro");
    jQuery(".city").attr("placeholder", "Cidade");
    jQuery(".state").attr("placeholder", "Estado");
    jQuery(".zip").attr("placeholder", "CEP");
});


/* Executa a requisição quando o campo CEP perder o foco */
   jQuery('.zip').blur(function(){

           /* Configura a requisição AJAX */
           jQuery.ajax({
                url : 'http://ww4.fastwebdev.com.br/guerreiros/consultar_cep.php', /* URL que será chamada */ 
                type : 'POST', /* Tipo da requisição */ 
                data: 'cep=' + jQuery('.zip').val(), /* dado que será enviado via POST */
                dataType: 'json', /* Tipo de transmissão */
                success: function(data){
                    if(data.sucesso == 1){
                        jQuery('.street').val(''+data.rua+','+data.bairro);                        
                        jQuery('.city').val(''+data.cidade);
                        jQuery('.state').val(''+data.estado);
                     }
                }
           });   
   return false;    
});
</script>
<?php echo $footer; ?>
