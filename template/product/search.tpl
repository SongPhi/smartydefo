{$header}
<div class="container">
  <ul class="breadcrumb">
    {foreach from=$breadcrumbs item=breadcrumb}
    <li><a href="{$breadcrumb.href}">{$breadcrumb.text}</a></li>
    <?php } ?>
  </ul>
  <div class="row">{$column_left}
    {if $column_left && $column_right}
    <?php $class = 'col-sm-6'; ?>
    {elseif $column_left || $column_right}
    <?php $class = 'col-sm-9'; ?>
    {else}
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="{$class}">{$content_top}
      <h1>{$heading_title}</h1>
      <label class="control-label" for="input-search">{$entry_search}</label>
      <div class="row">
        <div class="col-sm-4">
          <input type="text" name="search" value="{$search}" placeholder="{$text_keyword}" id="input-search" class="form-control" />
        </div>
        <div class="col-sm-3">
          <select name="category_id" class="form-control">
            <option value="0">{$text_category}</option>
            {foreach from=$categories item=category_1}
            {if $category_1.category_id == $category_id}
            <option value="{$category_1.category_id}" selected="selected">{$category_1.name}</option>
            {else}
            <option value="{$category_1.category_id}">{$category_1.name}</option>
            <?php } ?>
            {foreach from=$category_1.children item=category_2}
            {if $category_2.category_id == $category_id}
            <option value="{$category_2.category_id}" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{$category_2.name}</option>
            {else}
            <option value="{$category_2.category_id}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{$category_2.name}</option>
            <?php } ?>
            {foreach from=$category_2.children item=category_3}
            {if $category_3.category_id == $category_id}
            <option value="{$category_3.category_id}" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{$category_3.name}</option>
            {else}
            <option value="{$category_3.category_id}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{$category_3.name}</option>
            <?php } ?>
            <?php } ?>
            <?php } ?>
            <?php } ?>
          </select>
        </div>
        <div class="col-sm-3">
          <label class="checkbox-inline">
            {if $sub_category}
            <input type="checkbox" name="sub_category" value="1" checked="checked" />
            {else}
            <input type="checkbox" name="sub_category" value="1" />
            <?php } ?>
            {$text_sub_category}</label>
        </div>
      </div>
      <p>
        <label class="checkbox-inline">
          {if $description}
          <input type="checkbox" name="description" value="1" id="description" checked="checked" />
          {else}
          <input type="checkbox" name="description" value="1" id="description" />
          <?php } ?>
          {$entry_description}</label>
      </p>
      <input type="button" value="{$button_search}" id="button-search" class="btn btn-primary" />
      <h2>{$text_search}</h2>
      {if $products}
      <p><a href="{$compare}" id="compare-total">{$text_compare}</a></p>
      <div class="row">
        <div class="col-sm-3 hidden-xs">
          <div class="btn-group">
            <button type="button" id="list-view" class="btn btn-default" data-toggle="tooltip" title="{$button_list}"><i class="fa fa-th-list"></i></button>
            <button type="button" id="grid-view" class="btn btn-default" data-toggle="tooltip" title="{$button_grid}"><i class="fa fa-th"></i></button>
          </div>
        </div>
        <div class="col-sm-1 col-sm-offset-2 text-right">
          <label class="control-label" for="input-sort">{$text_sort}</label>
        </div>
        <div class="col-sm-3 text-right">
          <select id="input-sort" class="form-control col-sm-3" onchange="location = this.value;">
            {foreach from=$sorts item=sorts}
            {if $sorts.value == $sort . '-' . $order}
            <option value="{$sorts.href}" selected="selected">{$sorts.text}</option>
            {else}
            <option value="{$sorts.href}">{$sorts.text}</option>
            <?php } ?>
            <?php } ?>
          </select>
        </div>
        <div class="col-sm-1 text-right">
          <label class="control-label" for="input-limit">{$text_limit}</label>
        </div>
        <div class="col-sm-2 text-right">
          <select id="input-limit" class="form-control" onchange="location = this.value;">
            {foreach from=$limits item=limits}
            {if $limits.value == $limit}
            <option value="{$limits.href}" selected="selected">{$limits.text}</option>
            {else}
            <option value="{$limits.href}">{$limits.text}</option>
            <?php } ?>
            <?php } ?>
          </select>
        </div>
      </div>
      <br />
      <div class="row">
        {foreach from=$products item=product}
        <div class="product-layout product-list col-xs-12">
          <div class="product-thumb">
            <div class="image"><a href="{$product.href}"><img src="{$product.thumb}" alt="{$product.name}" title="{$product.name}" class="img-responsive" /></a></div>
            <div class="caption">
              <h4><a href="{$product.href}">{$product.name}</a></h4>
              <p>{$product.description}</p>
              {if $product.price}
              <p class="price">
                {if !$product.special}
                {$product.price}
                {else}
                <span class="price-new">{$product.special}</span> <span class="price-old">{$product.price}</span>
                <?php } ?>
                {if $product.tax}
                <span class="price-tax">{$text_tax} {$product.tax}</span>
                <?php } ?>
              </p>
              <?php } ?>
              {if $product.rating}
              <div class="rating">
                <?php for ($i = 1; $i <= 5; $i++) { ?>
                {if $product.rating < $i}
                <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
                {else}
                <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
                <?php } ?>
                <?php } ?>
              </div>
              <?php } ?>
            </div>
            <div class="button-group">
              <button type="button" onclick="cart.add('{$product.product_id}');"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md">{$button_cart}</span></button>
              <button type="button" data-toggle="tooltip" title="{$button_wishlist}" onclick="wishlist.add('{$product.product_id}');"><i class="fa fa-heart"></i></button>
              <button type="button" data-toggle="tooltip" title="{$button_compare}" onclick="compare.add('{$product.product_id}');"><i class="fa fa-exchange"></i></button>
            </div>
          </div>
        </div>
        <?php } ?>
      </div>
      <div class="row">
        <div class="col-sm-6 text-left">{$pagination}</div>
        <div class="col-sm-6 text-right">{$results}</div>
      </div>
      {else}
      <p>{$text_empty}</p>
      <?php } ?>
      {$content_bottom}</div>
    {$column_right}</div>
</div>
<script type="text/javascript"><!--
$('#button-search').bind('click', function() {
	url = 'index.php?route=product/search';
	
	var search = $('#content input[name=\'search\']').prop('value');
	
	if (search) {
		url += '&search=' + encodeURIComponent(search);
	}

	var category_id = $('#content select[name=\'category_id\']').prop('value');
	
	if (category_id > 0) {
		url += '&category_id=' + encodeURIComponent(category_id);
	}
	
	var sub_category = $('#content input[name=\'sub_category\']:checked').prop('value');
	
	if (sub_category) {
		url += '&sub_category=true';
	}
		
	var filter_description = $('#content input[name=\'description\']:checked').prop('value');
	
	if (filter_description) {
		url += '&description=true';
	}

	location = url;
});

$('#content input[name=\'search\']').bind('keydown', function(e) {
	if (e.keyCode == 13) {
		$('#button-search').trigger('click');
	}
});

$('select[name=\'category_id\']').on('change', function() {
	if (this.value == '0') {
		$('input[name=\'sub_category\']').prop('disabled', true);
	} else {
		$('input[name=\'sub_category\']').prop('disabled', false);
	}
});

$('select[name=\'category_id\']').trigger('change');
--></script> 
{$footer} 