<form class="form-horizontal">
  {if $addresses}
  <div class="radio">
    <label>
      <input type="radio" name="payment_address" value="existing" checked="checked" />
      {$text_address_existing}</label>
  </div>
  <div id="payment-existing">
    <select name="address_id" class="form-control">
      {foreach from=$addresses item=address}
      {if $address.address_id == $address_id}
      <option value="{$address.address_id}" selected="selected">{$address.firstname} {$address.lastname}, {$address.address_1}, {$address.city}, {$address.zone}, {$address.country}</option>
      {else}
      <option value="{$address.address_id}">{$address.firstname} {$address.lastname}, {$address.address_1}, {$address.city}, {$address.zone}, {$address.country}</option>
      <?php } ?>
      <?php } ?>
    </select>
  </div>
  <div class="radio">
    <label>
      <input type="radio" name="payment_address" value="new" />
      {$text_address_new}</label>
  </div>
  <?php } ?>
  <br />
  <div id="payment-new" style="display: {($addresses ? 'none' : 'block')};">
    <div class="form-group required">
      <label class="col-sm-2 control-label" for="input-payment-firstname">{$entry_firstname}</label>
      <div class="col-sm-10">
        <input type="text" name="firstname" value="" placeholder="{$entry_firstname}" id="input-payment-firstname" class="form-control" />
      </div>
    </div>
    <div class="form-group required">
      <label class="col-sm-2 control-label" for="input-payment-lastname">{$entry_lastname}</label>
      <div class="col-sm-10">
        <input type="text" name="lastname" value="" placeholder="{$entry_lastname}" id="input-payment-lastname" class="form-control" />
      </div>
    </div>
    <div class="form-group">
      <label class="col-sm-2 control-label" for="input-payment-company">{$entry_company}</label>
      <div class="col-sm-10">
        <input type="text" name="company" value="" placeholder="{$entry_company}" id="input-payment-company" class="form-control" />
      </div>
    </div>
    <div class="form-group required">
      <label class="col-sm-2 control-label" for="input-payment-address-1">{$entry_address_1}</label>
      <div class="col-sm-10">
        <input type="text" name="address_1" value="" placeholder="{$entry_address_1}" id="input-payment-address-1" class="form-control" />
      </div>
    </div>
    <div class="form-group">
      <label class="col-sm-2 control-label" for="input-payment-address-2">{$entry_address_2}</label>
      <div class="col-sm-10">
        <input type="text" name="address_2" value="" placeholder="{$entry_address_2}" id="input-payment-address-2" class="form-control" />
      </div>
    </div>
    <div class="form-group required">
      <label class="col-sm-2 control-label" for="input-payment-city">{$entry_city}</label>
      <div class="col-sm-10">
        <input type="text" name="city" value="" placeholder="{$entry_city}" id="input-payment-city" class="form-control" />
      </div>
    </div>
    <div class="form-group required">
      <label class="col-sm-2 control-label" for="input-payment-postcode">{$entry_postcode}</label>
      <div class="col-sm-10">
        <input type="text" name="postcode" value="" placeholder="{$entry_postcode}" id="input-payment-postcode" class="form-control" />
      </div>
    </div>
    <div class="form-group required">
      <label class="col-sm-2 control-label" for="input-payment-country">{$entry_country}</label>
      <div class="col-sm-10">
        <select name="country_id" id="input-payment-country" class="form-control">
          <option value="">{$text_select}</option>
          {foreach from=$countries item=country}
          {if $country.country_id == $country_id}
          <option value="{$country.country_id}" selected="selected">{$country.name}</option>
          {else}
          <option value="{$country.country_id}">{$country.name}</option>
          <?php } ?>
          <?php } ?>
        </select>
      </div>
    </div>
    <div class="form-group required">
      <label class="col-sm-2 control-label" for="input-payment-zone">{$entry_zone}</label>
      <div class="col-sm-10">
        <select name="zone_id" id="input-payment-zone" class="form-control">
        </select>
      </div>
    </div>
    {foreach from=$custom_fields item=custom_field}
    {if $custom_field.location == 'address'}
    {if $custom_field.type == 'select'}
    <div class="form-group{($custom_field.required ? ' required' : '')} custom-field" data-sort="{$custom_field.sort_order}">
      <label class="col-sm-2 control-label" for="input-payment-custom-field{$custom_field.custom_field_id}">{$custom_field.name}</label>
      <div class="col-sm-10">
        <select name="custom_field[{$custom_field.custom_field_id}]" id="input-payment-custom-field{$custom_field.custom_field_id}" class="form-control">
          <option value="">{$text_select}</option>
          {foreach from=$custom_field.custom_field_value item=custom_field_value}
          <option value="{$custom_field_value.custom_field_value_id}">{$custom_field_value.name}</option>
          <?php } ?>
        </select>
      </div>
    </div>
    <?php } ?>
    {if $custom_field.type == 'radio'}
    <div class="form-group{($custom_field.required ? ' required' : '')} custom-field" data-sort="{$custom_field.sort_order}">
      <label class="col-sm-2 control-label">{$custom_field.name}</label>
      <div class="col-sm-10">
        <div id="input-payment-custom-field{$custom_field.custom_field_id}">
          {foreach from=$custom_field.custom_field_value item=custom_field_value}
          <div class="radio">
            <label>
              <input type="radio" name="custom_field[{$custom_field.custom_field_id}]" value="{$custom_field_value.custom_field_value_id}" />
              {$custom_field_value.name}</label>
          </div>
          <?php } ?>
        </div>
      </div>
    </div>
    <?php } ?>
    {if $custom_field.type == 'checkbox'}
    <div class="form-group{($custom_field.required ? ' required' : '')} custom-field" data-sort="{$custom_field.sort_order}">
      <label class="col-sm-2 control-label">{$custom_field.name}</label>
      <div class="col-sm-10">
        <div id="input-payment-custom-field{$custom_field.custom_field_id}">
          {foreach from=$custom_field.custom_field_value item=custom_field_value}
          <div class="checkbox">
            <label>
              <input type="checkbox" name="custom_field[{$custom_field.custom_field_id}][]" value="{$custom_field_value.custom_field_value_id}" />
              {$custom_field_value.name}</label>
          </div>
          <?php } ?>
        </div>
      </div>
    </div>
    <?php } ?>
    {if $custom_field.type == 'text'}
    <div class="form-group{($custom_field.required ? ' required' : '')} custom-field" data-sort="{$custom_field.sort_order}">
      <label class="col-sm-2 control-label" for="input-payment-custom-field{$custom_field.custom_field_id}">{$custom_field.name}</label>
      <div class="col-sm-10">
        <input type="text" name="custom_field[{$custom_field.custom_field_id}]" value="{$custom_field.value}" placeholder="{$custom_field.name}" id="input-payment-custom-field{$custom_field.custom_field_id}" class="form-control" />
      </div>
    </div>
    <?php } ?>
    {if $custom_field.type == 'textarea'}
    <div class="form-group{($custom_field.required ? ' required' : '')} custom-field" data-sort="{$custom_field.sort_order}">
      <label class="col-sm-2 control-label" for="input-payment-custom-field{$custom_field.custom_field_id}">{$custom_field.name}</label>
      <div class="col-sm-10">
        <textarea name="custom_field[{$custom_field.custom_field_id}]" rows="5" placeholder="{$custom_field.name}" id="input-payment-custom-field{$custom_field.custom_field_id}" class="form-control">{$custom_field.value}</textarea>
      </div>
    </div>
    <?php } ?>
    {if $custom_field.type == 'file'}
    <div class="form-group{($custom_field.required ? ' required' : '')} custom-field" data-sort="{$custom_field.sort_order}">
      <label class="col-sm-2 control-label">{$custom_field.name}</label>
      <div class="col-sm-10">
        <button type="button" id="button-payment-custom-field{$custom_field.custom_field_id}" data-loading-text="{$text_loading}" class="btn btn-default"><i class="fa fa-upload"></i> {$button_upload}</button>
        <input type="hidden" name="custom_field[{$custom_field.custom_field_id}]" value="" id="input-payment-custom-field{$custom_field.custom_field_id}" />
      </div>
    </div>
    <?php } ?>
    {if $custom_field.type == 'date'}
    <div class="form-group{($custom_field.required ? ' required' : '')} custom-field" data-sort="{$custom_field.sort_order}">
      <label class="col-sm-2 control-label" for="input-payment-custom-field{$custom_field.custom_field_id}">{$custom_field.name}</label>
      <div class="col-sm-10">
        <div class="input-group date">
          <input type="text" name="custom_field[{$custom_field.custom_field_id}]" value="{$custom_field.value}" placeholder="{$custom_field.name}" data-date-format="YYYY-MM-DD" id="input-payment-custom-field{$custom_field.custom_field_id}" class="form-control" />
          <span class="input-group-btn">
          <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
          </span></div>
      </div>
    </div>
    <?php } ?>
    {if $custom_field.type == 'time'}
    <div class="form-group{($custom_field.required ? ' required' : '')} custom-field" data-sort="{$custom_field.sort_order}">
      <label class="col-sm-2 control-label" for="input-payment-custom-field{$custom_field.custom_field_id}">{$custom_field.name}</label>
      <div class="col-sm-10">
        <div class="input-group time">
          <input type="text" name="custom_field[{$custom_field.custom_field_id}]" value="{$custom_field.value}" placeholder="{$custom_field.name}" data-date-format="HH:mm" id="input-payment-custom-field{$custom_field.custom_field_id}" class="form-control" />
          <span class="input-group-btn">
          <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
          </span></div>
      </div>
    </div>
    <?php } ?>
    {if $custom_field.type == 'datetime'}
    <div class="form-group{($custom_field.required ? ' required' : '')} custom-field" data-sort="{$custom_field.sort_order}">
      <label class="col-sm-2 control-label" for="input-payment-custom-field{$custom_field.custom_field_id}">{$custom_field.name}</label>
      <div class="col-sm-10">
        <div class="input-group datetime">
          <input type="text" name="custom_field[{$custom_field.custom_field_id}]" value="{$custom_field.value}" placeholder="{$custom_field.name}" data-date-format="YYYY-MM-DD HH:mm" id="input-payment-custom-field{$custom_field.custom_field_id}" class="form-control" />
          <span class="input-group-btn">
          <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
          </span></div>
      </div>
    </div>
    <?php } ?>
    <?php } ?>
    <?php } ?>
  </div>
  <div class="buttons clearfix">
    <div class="pull-right">
      <input type="button" value="{$button_continue}" id="button-payment-address" data-loading-text="{$text_loading}" class="btn btn-primary" />
    </div>
  </div>
</form>
<script type="text/javascript"><!--
$('input[name=\'payment_address\']').on('change', function() {
	if (this.value == 'new') {
		$('#payment-existing').hide();
		$('#payment-new').show();
	} else {
		$('#payment-existing').show();
		$('#payment-new').hide();
	}
});
//--></script>
<script type="text/javascript"><!--
// Sort the custom fields
$('#collapse-payment-address .form-group[data-sort]').detach().each(function() {
	if ($(this).attr('data-sort') >= 0 && $(this).attr('data-sort') <= $('#collapse-payment-address .form-group').length) {
		$('#collapse-payment-address .form-group').eq($(this).attr('data-sort')).before(this);
	} 
	
	if ($(this).attr('data-sort') > $('#collapse-payment-address .form-group').length) {
		$('#collapse-payment-address .form-group:last').after(this);
	}
		
	if ($(this).attr('data-sort') < -$('#collapse-payment-address .form-group').length) {
		$('#collapse-payment-address .form-group:first').before(this);
	}
});
//--></script>
<script type="text/javascript"><!--
$('#collapse-payment-address button[id^=\'button-payment-custom-field\']').on('click', function() {
	var node = this;

	$('#form-upload').remove();

	$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

	$('#form-upload input[name=\'file\']').trigger('click');

	timer = setInterval(function() {
		if ($('#form-upload input[name=\'file\']').val() != '') {
			clearInterval(timer);
			
			$.ajax({
				url: 'index.php?route=tool/upload',
				type: 'post',
				dataType: 'json',
				data: new FormData($('#form-upload')[0]),
				cache: false,
				contentType: false,
				processData: false,
				beforeSend: function() {
					$(node).button('loading');
				},
				complete: function() {
					$(node).button('reset');
				},
				success: function(json) {
					$(node).parent().find('.text-danger').remove();;
					
					if (json['error']) {
						$(node).parent().find('input[name^=\'custom_field\']').after('<div class="text-danger">' + json.error + '</div>');
					}
	
					if (json['success']) {
						alert(json['success']);
	
						$(node).parent().find('input[name^=\'custom_field\']').attr('value', json.code);
					}
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		}
	}, 500);
});
//--></script>
<script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});

$('.time').datetimepicker({
	pickDate: false
});

$('.datetime').datetimepicker({
	pickDate: true,
	pickTime: true
});
//--></script>
<script type="text/javascript"><!--
$('#collapse-payment-address select[name=\'country_id\']').on('change', function() {
	$.ajax({
		url: 'index.php?route=checkout/checkout/country&country_id=' + this.value,
		dataType: 'json',
		beforeSend: function() {
			$('#collapse-payment-address select[name=\'country_id\']').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
		},
		complete: function() {
			$('.fa-spin').remove();
		},
		success: function(json) {
			$('.fa-spin').remove();

			if (json['postcode_required'] == '1') {
				$('#collapse-payment-address input[name=\'postcode\']').parent().parent().addClass('required');
			} else {
				$('#collapse-payment-address input[name=\'postcode\']').parent().parent().removeClass('required');
			}

			html = '<option value="">{$text_select}</option>';

			if (json['zone'] != '') {
				for (i = 0; i < json['zone'].length; i++) {
					html += '<option value="' + json['zone'][i]['zone_id'] + '"';

					if (json['zone'][i]['zone_id'] == '{$zone_id}') {
						html += ' selected="selected"';
					}

					html += '>' + json['zone'][i]['name'] + '</option>';
				}
			} else {
				html += '<option value="0" selected="selected">{$text_none}</option>';
			}

			$('#collapse-payment-address select[name=\'zone_id\']').html(html);
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('#collapse-payment-address select[name=\'country_id\']').trigger('change');
//--></script>