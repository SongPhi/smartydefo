{$header}
<div class="container">
  <ul class="breadcrumb">
    {foreach from=$breadcrumbs item=breadcrumb}
    <li><a href="{$breadcrumb.href}"> {$breadcrumb.text}</a></li>
    <?php } ?>
  </ul>
  {if $error_warning}
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> {$error_warning}</div>
  <?php } ?>
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
      <p>{$text_description}</p>
      <form action="{$action}" method="post" enctype="multipart/form-data" class="form-horizontal">
        <fieldset>
          <legend>{$text_order}</legend>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-firstname">{$entry_firstname}</label>
            <div class="col-sm-10">
              <input type="text" name="firstname" value="{$firstname}" placeholder="{$entry_firstname}" id="input-firstname" class="form-control" />
              {if $error_firstname}
              <div class="text-danger">{$error_firstname}</div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-lastname">{$entry_lastname}</label>
            <div class="col-sm-10">
              <input type="text" name="lastname" value="{$lastname}" placeholder="{$entry_lastname}" id="input-lastname" class="form-control" />
              {if $error_lastname}
              <div class="text-danger">{$error_lastname}</div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-email">{$entry_email}</label>
            <div class="col-sm-10">
              <input type="text" name="email" value="{$email}" placeholder="{$entry_email}" id="input-email" class="form-control" />
              {if $error_email}
              <div class="text-danger">{$error_email}</div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-telephone">{$entry_telephone}</label>
            <div class="col-sm-10">
              <input type="text" name="telephone" value="{$telephone}" placeholder="{$entry_telephone}" id="input-telephone" class="form-control" />
              {if $error_telephone}
              <div class="text-danger">{$error_telephone}</div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-order-id">{$entry_order_id}</label>
            <div class="col-sm-10">
              <input type="text" name="order_id" value="{$order_id}" placeholder="{$entry_order_id}" id="input-order-id" class="form-control" />
              {if $error_order_id}
              <div class="text-danger">{$error_order_id}</div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-date-ordered">{$entry_date_ordered}</label>
            <div class="col-sm-3">
              <div class="input-group date"><input type="text" name="date_ordered" value="{$date_ordered}" placeholder="{$entry_date_ordered}" data-date-format="YYYY-MM-DD" id="input-date-ordered" class="form-control" /><span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
            </div>
          </div>
        </fieldset>
        <fieldset>
          <legend>{$text_product}</legend>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-product">{$entry_product}</label>
            <div class="col-sm-10">
              <input type="text" name="product" value="{$product}" placeholder="{$entry_product}" id="input-product" class="form-control" />
              {if $error_product}
              <div class="text-danger">{$error_product}</div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-model">{$entry_model}</label>
            <div class="col-sm-10">
              <input type="text" name="model" value="{$model}" placeholder="{$entry_model}" id="input-model" class="form-control" />
              {if $error_model}
              <div class="text-danger">{$error_model}</div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-quantity">{$entry_quantity}</label>
            <div class="col-sm-10">
              <input type="text" name="quantity" value="{$quantity}" placeholder="{$entry_quantity}" id="input-quantity" class="form-control" />
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label">{$entry_reason}</label>
            <div class="col-sm-10">
              {foreach from=$return_reasons item=return_reason}
              {if $return_reason.return_reason_id == $return_reason_id}
              <div class="radio">
                <label>
                  <input type="radio" name="return_reason_id" value="{$return_reason.return_reason_id}" checked="checked" />
                  {$return_reason.name}</label>
              </div>
              {else}
              <div class="radio">
                <label>
                  <input type="radio" name="return_reason_id" value="{$return_reason.return_reason_id}" />
                  {$return_reason.name}</label>
              </div>
              <?php  } ?>
              <?php  } ?>
              {if $error_reason}
              <div class="text-danger">{$error_reason}</div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label">{$entry_opened}</label>
            <div class="col-sm-10">
              <label class="radio-inline">
                {if $opened}
                <input type="radio" name="opened" value="1" checked="checked" />
                {else}
                <input type="radio" name="opened" value="1" />
                <?php } ?>
                {$text_yes}</label>
              <label class="radio-inline">
                {if !$opened}
                <input type="radio" name="opened" value="0" checked="checked" />
                {else}
                <input type="radio" name="opened" value="0" />
                <?php } ?>
                {$text_no}</label>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-comment">{$entry_fault_detail}</label>
            <div class="col-sm-10">
              <textarea name="comment" rows="10" placeholder="{$entry_fault_detail}" id="input-comment" class="form-control">{$comment}</textarea>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-captcha">{$entry_captcha}</label>
            <div class="col-sm-10">
              <input type="text" name="captcha" value="" placeholder="{$entry_captcha}" id="input-captcha" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <div class="col-sm-10 pull-right">
              <img src="index.php?route=tool/captcha" alt="" />
              {if $error_captcha}
                <div class="text-danger">{$error_captcha}</div>
              <?php } ?>
            </div>
          </div>
        </fieldset>
        {if $text_agree}
        <div class="buttons clearfix">
          <div class="pull-left"><a href="{$back}" class="btn btn-danger">{$button_back}</a></div>
          <div class="pull-right">{$text_agree}
            {if $agree}
            <input type="checkbox" name="agree" value="1" checked="checked" />
            {else}
            <input type="checkbox" name="agree" value="1" />
            <?php } ?>
            <input type="submit" value="{$button_submit}" class="btn btn-primary" />
          </div>
        </div>
        {else}
        <div class="buttons clearfix">
          <div class="pull-left"><a href="{$back}" class="btn btn-default">{$button_back}</a></div>
          <div class="pull-right">
            <input type="submit" value="{$button_submit}" class="btn btn-primary" />
          </div>
        </div>
        <?php } ?>
      </form>
      {$content_bottom}</div>
    {$column_right}</div>
</div>
<script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});
//--></script>
{$footer}
