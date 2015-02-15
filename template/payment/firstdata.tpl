<form action="{$action}" method="POST" class="form-horizontal" id="firstdata_form_redirect">
  <fieldset id="payment">
    <input type="hidden" name="txntype" value="{$txntype}" />
    <input type="hidden" name="timezone" value="GMT" />
    <input type="hidden" name="txndatetime" value="{$timestamp}" />
    <input type="hidden" name="hash" value="{$hash}" />
    <input type="hidden" name="storename" value="{$merchant_id}" />
    <input type="hidden" name="mode" value="payonly" />
    <input type="hidden" name="chargetotal" value="{$amount}" />
    <input type="hidden" name="currency" value="{$currency}" />
    <input type="hidden" name="oid" value="{$order_id}" />
    <input type="hidden" name="mobileMode" value="{$mobile}" />
    <input type="hidden" name="responseSuccessURL" value="{$url_success}" />
    <input type="hidden" name="responseFailURL" value="{$url_fail}" />
    <input type="hidden" name="transactionNotificationURL" value="{$url_notify}" />
    <input type="hidden" name="sname" value="{$sname}" />
    <input type="hidden" name="saddr1" value="{$saddr1}" />
    <input type="hidden" name="saddr2" value="{$saddr2}" />
    <input type="hidden" name="scity" value="{$scity}" />
    <input type="hidden" name="sstate" value="{$sstate}" />
    <input type="hidden" name="scountry" value="{$scountry}" />
    <input type="hidden" name="szip" value="{$szip}" />
    <input type="hidden" name="bcompany" value="{$bcompany}" />
    <input type="hidden" name="bname" value="{$bname}" />
    <input type="hidden" name="baddr1" value="{$baddr1}" />
    <input type="hidden" name="baddr2" value="{$baddr2}" />
    <input type="hidden" name="bcity" value="{$bcity}" />
    <input type="hidden" name="bstate" value="{$bstate}" />
    <input type="hidden" name="bcountry" value="{$bcountry}" />
    <input type="hidden" name="bzip" value="{$bzip}" />
    <input type="hidden" name="invoicenumber" value="{$version}" />

    {if $card_storage == 1}
      <?php $i = 1; if (!empty($stored_cards)) { ?>
        {foreach from=$stored_cards item=card}
          <p><input type="radio" name="hosteddataid" value="{$card.token}" {($i == 1 ? ' checked="checked"' : '')} /> {$card.digits . ' - ' . $card.expire_month . '/' . $card.expire_year}</p>
          <?php $i++; ?>
        <?php } ?>
        <p><input type="radio" name="hosteddataid" value="{$new_hosted_id}" {$i == 1 ? ' checked="checked"' : ''} /> Use a new card</p>
      {else}
        <input type="hidden" name="hosteddataid" value="{$new_hosted_id}" />
      <?php } ?>
    <?php } ?>
  </fieldset>
</form>

<div class="buttons">
  <div class="pull-right">
    <input type="button" value="{$button_confirm}" id="button-confirm" class="btn btn-primary" />
  </div>
</div>

<script type="text/javascript"><!--
$('#button-confirm').bind('click', function() {
  $('#firstdata_form_redirect').submit();
});
//--></script>