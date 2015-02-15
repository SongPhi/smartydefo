<footer>
  <div class="container">
    <div class="row">
      {if $informations}
      <div class="col-sm-3">
        <h5>{$text_information}</h5>
        <ul class="list-unstyled">
          {foreach from=$informations item=information}
          <li><a href="{$information.href}">{$information.title}</a></li>
          {/foreach}
        </ul>
      </div>
      {/if}
      <div class="col-sm-3">
        <h5>{$text_service}</h5>
        <ul class="list-unstyled">
          <li><a href="{$contact}">{$text_contact}</a></li>
          <li><a href="{$return}">{$text_return}</a></li>
          <li><a href="{$sitemap}">{$text_sitemap}</a></li>
        </ul>
      </div>
      <div class="col-sm-3">
        <h5>{$text_extra}</h5>
        <ul class="list-unstyled">
          <li><a href="{$manufacturer}">{$text_manufacturer}</a></li>
          <li><a href="{$voucher}">{$text_voucher}</a></li>
          <li><a href="{$affiliate}">{$text_affiliate}</a></li>
          <li><a href="{$special}">{$text_special}</a></li>
        </ul>
      </div>
      <div class="col-sm-3">
        <h5>{$text_account}</h5>
        <ul class="list-unstyled">
          <li><a href="{$account}">{$text_account}</a></li>
          <li><a href="{$order}">{$text_order}</a></li>
          <li><a href="{$wishlist}">{$text_wishlist}</a></li>
          <li><a href="{$newsletter}">{$text_newsletter}</a></li>
        </ul>
      </div>
    </div>
    <hr>
    <p>{$powered}</p> 
  </div>
</footer>

<!--
OpenCart is open source software and you are free to remove the powered by OpenCart if you want, but its generally accepted practise to make a small donation.
Please donate via PayPal to donate@opencart.com
//--> 

<!-- Theme created by Welford Media for OpenCart 2.0 www.welfordmedia.co.uk -->

</body></html>