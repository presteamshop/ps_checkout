{**
 * 2007-2020 PrestaShop and Contributors
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2007-2020 PrestaShop SA and Contributors
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}

<div id="ps_checkout_paypal_container">
<link rel="preload" href="{$paypalSdkLink|escape:'htmlall':'UTF-8'|replace:'&amp;':'&'}" as="script">

<div class="paypal-tips">{l s='You will be redirected to the related gateway to complete payment' mod='ps_checkout'}</div>

<div>
  <div id="paypal-button-container"></div>

  <form id="conditions-to-approve-paypal" method="GET">
    <label for="conditions_to_approve">
      <input id="conditions_to_approve" type="checkbox" name="conditions_to_approve" class="buttons-approve">
      {l s='I agree to the [1]terms of service[/1] and will adhere to them unconditionally.' mod='ps_checkout' tags=['<a href="$termsAndConditionsLink" id="cta-terms-and-conditions-checkout">']}
    </label>
  </form>
</div>

<div id="paypal-approve-error" class="hide-paypal-error">
  <article class="alert alert-danger" role="alert" data-alert="danger">
    <ul>
      <li>{l s='Please indicate that you have read Terms & Conditions and accept all terms.' mod='ps_checkout'}</li>
    </ul>
  </article>
</div>
</div>
    
<script type="text/javascript" src="{$jsPathInitPaypalSdk|escape:'javascript':'UTF-8'|replace:'&amp;':'&' nofilter}"></script>

<script>
  var cardNumberPlaceholder = "{l s='Card number' mod='ps_checkout'}";
  var expDatePlaceholder = "{l s='MM/YY' mod='ps_checkout'}";
  var cvvPlaceholder = "{l s='XXX' mod='ps_checkout'}";
  var paypalOrderId = "{$paypalOrderId|escape:'javascript':'UTF-8'}";
  var validateOrderLinkByCard = "{$validateOrderLinkByCard|escape:'javascript':'UTF-8'|replace:'&amp;':'&' nofilter}";
  var validateOrderLinkByPaypal = "{$validateOrderLinkByPaypal|escape:'javascript':'UTF-8'|replace:'&amp;':'&' nofilter}";
  var cardIsActive = "{$cardIsActive|escape:'javascript':'UTF-8'}";
  var paypalIsActive = "{$paypalIsActive|escape:'javascript':'UTF-8'}";
  var paypalPaymentOption = "{$paypalPaymentOption|escape:'javascript':'UTF-8'}";
  var hostedFieldsErrors = {$hostedFieldsErrors|escape:'javascript':'UTF-8'|stripslashes|replace:'&amp;':'&' nofilter};
/**
 * Create paypal script
 */
function initPaypalScript() {
  if (typeof paypalSdkPsCheckout !== 'undefined') {
    return;
  }

  let psCheckoutScript = document.getElementById('paypalSdkPsCheckout');

  if (psCheckoutScript !== null) {
    return;
  }

  var paypalScript = document.createElement('script');
  paypalScript.setAttribute('src', "{$paypalSdkLink|escape:'javascript':'UTF-8'|replace:'&amp;':'&' nofilter}");
  paypalScript.setAttribute('data-client-token', "{$clientToken|escape:'javascript':'UTF-8'}");
  paypalScript.setAttribute('id', 'psCheckoutPaypalSdk');
  paypalScript.setAttribute('data-namespace', 'paypalSdkPsCheckout');
  paypalScript.setAttribute('data-enable-3ds', '');
  paypalScript.setAttribute('async', '');
  document.head.appendChild(paypalScript);
}

initPaypalScript();
</script>

