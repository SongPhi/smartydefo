<form class="form-horizontal">
    <fieldset id="payment">
		{if !empty($cards)}
			<legend>{$text_credit_card}</legend>
			<div class="form-group">
				<label class="col-sm-2 control-label">{$entry_card}</label>
				<div class="col-sm-10">
					<label class="radio-inline">
						<input type="radio" name="CreateToken" value="0" checked="checked"/>
						{$entry_card_existing}
					</label>
					<label class="radio-inline">
						<input type="radio" name="CreateToken" value=""/>
						{$entry_card_new}
					</label>
				</div>
			</div>
			<div id="card-existing">                
				<div class="form-group required">
					<label class="col-sm-2 control-label" for="Token">{$entry_cc_choice}</label>
					<div class="col-sm-10">
						<select name="Token" class="form-control">
							{foreach from=$cards item=card}
								<option value="{$card.token}">{$text_card_type . ' ' . $card.type}, {$text_card_digits . ' ' . $card.digits}, {$text_card_expiry . ' ' . $card.expiry}</option>    
							<?php } ?>
						</select>
					</div>
				</div>
			</div>
			<div style="display:none" id="card-save" class="form-group">
				<label class="col-sm-2 control-label">{$entry_card_save}</label>
				<div class="col-sm-10">
					<div class="checkbox">
						<label>
							<input type="checkbox" name="CreateToken" value="1" disabled/>
						</label>
					</div>
				</div>
			</div>
		{elseif $sagepay_server_card}
			<legend>{$text_credit_card}</legend>
			<div class="form-group">
				<label class="col-sm-2 control-label">{$entry_card}</label>
				<div class="col-sm-10">
					<label class="radio-inline">
						<input type="radio" name="CreateToken" value="" checked="checked"/>
						{$entry_card_new}
					</label>
				</div>
			</div>
			<div id="card-save" class="form-group">
				<label class="col-sm-2 control-label">{$entry_card_save}</label>
				<div class="col-sm-10">
					<div class="checkbox">
						<label>
							<input type="checkbox" name="CreateToken" value="1"/>
						</label>
					</div>
				</div>
			</div>
		<?php } ?>
        <div class="buttons">
            <div class="pull-right">
                <input type="button" value="{$button_confirm}" id="button-confirm" data-loading-text="{$text_loading}" class="btn btn-primary" />
            </div>
        </div>
    </fieldset> 
</form>
<script type="text/javascript">
	$('input[name=\'CreateToken\']').on('change', function() {
		if (this.value === '0') {
			$('#card-existing').show();
			$('#card-save').hide();
			$('.form-control').prop('disabled', false);
			$('#card-save :input').prop('disabled', true);
		} else {
			$('#card-existing').hide();
			$('#card-save').show();
			$('.form-control').prop('disabled', true);
			$('#card-save :input').prop('disabled', false);
		}
	});
//</script>
<script type="text/javascript"><!--
    $('#button-confirm').bind('click', function() {
		$.ajax({
			url: 'index.php?route=payment/sagepay_server/send',
			type: 'post',
			data: $('#card-existing :input:checked, #card-save :input:enabled, #payment select:enabled'),
			dataType: 'json',
			cache: false,
			beforeSend: function() {
				$('#button-confirm').button('loading');
			},
			complete: function() {
				$('#button-confirm').button('reset');
			},
			success: function(json) {
				// if success
				if (json['redirect']) {
					html = '<form action="' + json['redirect'] + '" method="post" id="redirect">';
					html += '  <input type="hidden" name="Status" value="' + json['Status'] + '" />';
					html += '  <input type="hidden" name="StatusDetail" value="' + json['StatusDetail'] + '" />';

					html += '</form>';

					$('#payment').after(html);

					$('#redirect').submit();
				}

				// if error
				if (json['error']) {
					$('#payment').before('<div id="sagepay_message_error" class="alert alert-warning"><i class="fa fa-info-circle"></i> ' + json.error + '</div>');
				}
			}
		});
	});
//--></script>