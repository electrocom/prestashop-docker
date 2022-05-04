{**
 * 2007-2020 PrestaShop
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
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to http://www.prestashop.com for more information.
 *
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2007-2020 PrestaShop SA
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}


<section class="brands">
    <div class="tt-titletab">
        <h1 class="h1 products-section-title text-uppercase tt-title">	Newsletter</h1>
    </div>
    <div id="newslatter"  style="border:1px solid #e5e5e5;" class="col-sm-9">
        <div class="block_newsletter">
            <div class="tt-content col-sm-5">


                <div class="newsletter_title">
                    <h3 class="h3">Zyskaj 50zł Na Zakupy</h3>
                </div>

                <div class="ttContent">
                    Zostaw nam swój Email a wyślemy ci Voucher o wartości 50zł na zakupy w naszym sklepie.
                </div>
            </div>
            <div class="block_content col-sm-7">
                <form action="{$urls.pages.index}#footer" method="post">
                    <div class="row">
                        <div class="ttinput_newsletter">
                            <input
                                    class="btn btn-primary float-xs-right hidden-xs-down"
                                    name="submitNewsletter"
                                    type="submit"
                                    value="{l s='Subscribe' d='Shop.Theme.Actions'}"
                            >
                            <input
                                    class="btn btn-primary float-xs-right hidden-sm-up"
                                    name="submitNewsletter"
                                    type="submit"
                                    value="{l s='OK' d='Shop.Theme.Actions'}"
                            >
                            <div class="input-wrapper">
                                <input
                                        name="email"
                                        type="email"
                                        value="{$value}"
                                        placeholder="{l s='Your email address' d='Shop.Forms.Labels'}"
                                        aria-labelledby="block-newsletter-label"
                                        style="
    background-color: #f5f5f5;
    border: 1px solid #e5e5e5;
    border-radius: 4px;


    text-align: center;
    color: #666;
"
                                >
                            </div>
                            <input type="hidden" name="action" value="0">
                            <div class="clearfix"></div>
                        </div>
                        <div class="col-xs-12">
                            {if $conditions}
                                <p class="newsletter-desc">{$conditions}</p>
                            {/if}
                            {if $msg}
                                <p class="alert {if $nw_error}alert-danger{else}alert-success{/if}">
                                    {$msg}
                                </p>
                            {/if}
                            {if isset($id_module)}
                                {hook h='displayGDPRConsent' id_module=$id_module}
                            {/if}
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

</section>