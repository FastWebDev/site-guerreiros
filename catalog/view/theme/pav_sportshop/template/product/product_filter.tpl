<?php $olang = $this->registry->get('language'); ?>
<div class="product-filter clearfix"> <div class="inner clearfix">
  <div class="display">
    <div class="btn-group group-switch">
      <button type="button" id="list-view" class="btn btn-switch" data-toggle="tooltip" title="<?php echo $button_list; ?>"></button>
      <button type="button" id="grid-view" class="btn btn-switch" data-toggle="tooltip" title="<?php echo $button_grid; ?>"></button>
    </div>
  </div>    
  <div class="filter-right">
     <div class="product-compare pull-right"><a href="<?php echo $compare; ?>" class="btn btn-default" id="compare-total"><?php echo $text_compare; ?></a></div>
      <div class="sort pull-right">
        <span  for="input-sort"><?php echo $text_sort; ?></span>
        <select id="input-sort" class="form-control" onchange="location = this.value;">
          <?php foreach ($sorts as $sorts) { ?>
          <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
          <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
          <?php } else { ?>
          <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
          <?php } ?>
          <?php } ?>
        </select>
      </div>
     
      <div class="limit pull-right">
        <span  for="input-limit"><?php echo $text_limit; ?></span>
        <select id="input-limit" class="form-control" onchange="location = this.value;">
          <?php foreach ($limits as $limits) { ?>
          <?php if ($limits['value'] == $limit) { ?>
          <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
          <?php } else { ?>
          <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
          <?php } ?>
          <?php } ?>
        </select>
      </div>
     </div> 
   
</div>    </div> 
 
