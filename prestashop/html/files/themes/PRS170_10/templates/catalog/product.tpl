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
{extends file=$layout}
{assign var='freeshipping_price' value=Configuration::get('PS_SHIPPING_FREE_PRICE')}
{block name='head_seo' prepend}
    <link rel="canonical" href="{$product.canonical_url}">
{/block}

{block name='head' append}
    <meta property="og:type" content="product">
    <meta property="og:url" content="{$urls.current_url}">
    <meta property="og:title" content="{$page.meta.title}">
    <meta property="og:site_name" content="{$shop.name}">
    <meta property="og:description" content="{$page.meta.description}">
    <meta property="og:image" content="{$product.cover.large.url}">
    {if $product.show_price}
        <meta property="product:pretax_price:amount" content="{$product.price_tax_exc}">
        <meta property="product:pretax_price:currency" content="{$currency.iso_code}">
        <meta property="product:price:amount" content="{$product.price_amount}">
        <meta property="product:price:currency" content="{$currency.iso_code}">
    {/if}
    {if isset($product.weight) && ($product.weight != 0)}
        <meta property="product:weight:value" content="{$product.weight}">
        <meta property="product:weight:units" content="{$product.weight_unit}">
    {/if}
{/block}

{block name='content'}

    <section id="main" itemscope itemtype="https://schema.org/Product">

        {if $product->ean13}
            <meta itemprop="gtin13" content="{$product.ean13}">
        {/if}
        <div class="main-column row">
            <div class="col-md-5 pb-left-column">
                <h1 class="h1 tt-producttitle" itemprop="name">{block name='page_title'}{$product.name}{/block}</h1>
                {block name='page_content_container'}
                    <section class="page-content" id="content">

                        {block name='page_content'}


                            {block name='product_cover_thumbnails'}
                                {include file='catalog/_partials/product-cover-thumbnails.tpl'}
                            {/block}
                            <div class="scroll-box-arrows">
                                <i class="material-icons left">&#xE314;</i>
                                <i class="material-icons right">&#xE315;</i>
                            </div>

                        {/block}
                    </section>
                    <!-- @todo: use include file='catalog/_partials/product-flags.tpl'} -->
                    {block name='product_flags'}
                        <ul class="product-flags">
                            {foreach from=$product.flags item=flag}

                                <li class="product-flag {$flag.type}">{$flag.label}</li>

                            {/foreach}
                        </ul>
                    {/block}
                {/block}

            </div>
            <div class="col-md-7 pb-right-column">

                {block name='product_comment'}
                    {capture name='displayTtProductExtra'}{hook h='displayTtProductExtra'}{/capture}
                    {if $smarty.capture.displayTtProductExtra}
                        {$smarty.capture.displayTtProductExtra nofilter}
                    {/if}
                {/block}

                {block name='product_prices'}
                    {include file='catalog/_partials/product-prices.tpl'}
                {/block}
                <div class="product-information">
                    {block name='product_description_short'}
                        <div id="product-description-short-{$product.id}" itemprop="description">{$product.description_short nofilter}</div>
                    {/block}

                    {if $product.is_customizable && count($product.customizations.fields)}
                        {block name='product_customization'}
                            {include file="catalog/_partials/product-customization.tpl" customizations=$product.customizations}
                        {/block}
                    {/if}

                    <div class="product-actions">
                        {block name='product_buy'}
                            <form action="{$urls.pages.cart}" method="post" id="add-to-cart-or-refresh">
                                <input type="hidden" name="token" value="{$static_token}">
                                <input type="hidden" name="id_product" value="{$product.id}" id="product_page_product_id">
                                <input type="hidden" name="id_customization" value="{$product.id_customization}" id="product_customization_id">

                                {block name='product_variants'}
                                    {include file='catalog/_partials/product-variants.tpl'}
                                {/block}

                                {block name='product_pack'}
                                    {if $packItems}
                                        <section class="product-pack">
                                            <h3 class="h4">{l s='This pack contains' d='Shop.Theme.Catalog'}</h3>
                                            {foreach from=$packItems item="product_pack"}
                                                {block name='product_miniature'}
                                                    {include file='catalog/_partials/miniatures/pack-product.tpl' product=$product_pack}
                                                {/block}
                                            {/foreach}
                                        </section>
                                    {/if}
                                {/block}

                                {block name='hook_display_reassurance'}
                                    {hook h='displayReassurance'}
                                {/block}

                                <div class="blockreassurance_product">
                                    {if (int)$freeshipping_price <(int)$product.price|strip:""}
                                        <div style="cursor:pointer;" onclick="window.open('https://www.gigarabaty.pl/pl/content/1-metody-wysylki')">
                                        <span class="item-product">

                                        <img src="/modules/blockreassurance/img/ic_local_shipping_black_36dp_1x.png">

                                        </span>

                                        <p class="block-title">Darmowa dostawa!</p>

                                        </div>
                                    {/if}

                                    {block name='product_availability'}
                                    <div>
                                        {if $product.show_availability && $product.availability_message}
                                            {if $product.availability == 'available'}
                                                <i class="material-icons rtl-no-flip product-available">&#xE5CA;</i>
                                            {elseif $product.availability == 'last_remaining_items'}
                                                <i class="material-icons product-last-items">&#xE002;</i>
                                            {else}
                                                <i class="material-icons product-unavailable">&#xE14B;</i>
                                            {/if}
                                            {$product.availability_message}
                                        {/if}
                                    </div>
                                    {/block}

                                    <div class="clearfix"></div>
                                </div>




                                {block name='product_discounts'}
                                    {include file='catalog/_partials/product-discounts.tpl'}
                                {/block}

                                {block name='product_add_to_cart'}
                                    {include file='catalog/_partials/product-add-to-cart.tpl'}
                                {/block}



                                {block name='product_additional_info'}



                                    {include file='catalog/_partials/product-additional-info.tpl'}
                                {/block}

                                {* Input to refresh product HTML removed, block kept for compatibility with themes *}
                                {block name='product_refresh'}{/block}
                            </form>
                        {/block}

                    </div>




                </div>
            </div>
        </div>
        <div class="ttproductpagetab">


            <div class="accordion" id="accordionExample">


                <div class="card">
                    <div class="card-header" id="headingOne">
                        <h2 class="mb-0">
                            <button class="btn btn-link nav-item" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                {l s='Description' d='Shop.Theme.Catalog'}
                            </button>
                        </h2>
                    </div>

                    <div id="collapseOne" class="collapse show in" aria-labelledby="headingOne" data-parent="#accordionExample">
                        <div class="card-body">
                            {block name='product_description'}
                                <div class="product-description">{$product.description nofilter}</div>
                            {/block}
                        </div>
                    </div>
                </div>


                <div class="card">
                    <div class="card-header" id="headingTwo">
                        <h2 class="mb-0">
                            <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
                                {l s='Product Details' d='Shop.Theme.Catalog'}
                            </button>
                        </h2>
                    </div>
                    <div id="collapseTwo" class="collapse show in"" aria-labelledby="headingTwo" data-parent="#accordionExample">
                    <div class="card-body">
                        {block name='product_details'}
                            {include file='catalog/_partials/product-details.tpl'}
                        {/block}
                    </div>
                </div>
            </div>
            {block name='product_images'}
                <div class="card">
                    <div class="card-header" id="headingOne">
                        <h2 class="mb-0">
                            <button class="btn btn-link nav-item" type="button" data-toggle="collapse" data-target="#collapseImages" aria-expanded="true" aria-controls="collapseImages">
                                {l s='Zdjęcia' d='Shop.Theme.Catalog'}
                            </button>
                        </h2>
                    </div>

                    <div id="collapseImages" class="collapse show in" aria-labelledby="headingImages" data-parent="#accordionExample">
                        <div class="card-body">

                            <div class="row">
                                {foreach from=$product.images item=image}
                                    <div class="col-md-6 ">
                                        <div class="thumbnail">
                                            <a href="{$image.bySize.large_default.url}" target="_blank">
                                                <img src="{$image.bySize.large_default.url}" alt="{$image.legend}" style="width:100%">

                                            </a>
                                        </div>
                                    </div>
                                {/foreach}
                            </div>
                        </div>
                    </div>
                </div>
            {/block}
            {if $product.attachments}
            <div class="card">
                <div class="card-header" id="headingThree">
                    <h2 class="mb-0">
                        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="true" aria-controls="collapseThree">
                            {l s='Attachments' d='Shop.Theme.Catalog'}
                        </button>
                    </h2>
                </div>
                <div id="collapseThree" class="collapse show in"" aria-labelledby="headingThree" data-parent="#accordionExample">
                <div class="card-body">
                    <section class="product-attachments">

                        {foreach from=$product.attachments item=attachment}
                            <div class="attachment">
                                <h4><a href="{url entity='attachment' params=['id_attachment' => $attachment.id_attachment]}">{$attachment.name}</a></h4>
                                <p>{$attachment.description}</p
                                ><a href="{url entity='attachment' params=['id_attachment' => $attachment.id_attachment]}">
                                    {l s='Download' d='Shop.Theme.Actions'} ({$attachment.file_size_formatted})
                                    <img style="width: 80px;" src="{$urls.img_url}pdfdownload.png">
                                </a>
                            </div>
                        {/foreach}
                    </section>
                </div>
            </div>
        </div>
        {/if}
        <div class="card">
            <div class="card-header" id="heading_product_comment_tab_content">
                <h2 class="mb-0">
                    <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#product_comment_tab_content" aria-expanded="true" aria-controls="product_comment_tab_content">
                        {l s='Opinie' mod='ttproductcomments'}
                    </button>
                </h2>
            </div>

                {block name='product_comment_tab_content'}
                    {capture name='displayTtProductTabContent'}{hook h='displayTtProductTabContent'}{/capture}
                    {if $smarty.capture.displayTtProductTabContent}
                        {$smarty.capture.displayTtProductTabContent nofilter}
                    {/if}
                {/block}

        </div>
        </div>
        </div>
















        {block name='product_accessories'}
            {if $accessories}
                <section class="product-accessories clearfix">
                    {assign var="tt_cnt" value="1"}
                    {assign var="tt_total" value="0"}
                    {foreach from=$accessories item="product_accessory"}
                        {$tt_total = $tt_total+1}
                    {/foreach}
                    <div class="tt-titletab">
                        <h3 class="tt-title">{l s='You might also like' d='Shop.Theme.Catalog'}</h3>
                        {if $tt_total > 4}
                            <div class="customNavigation">
                                <a class="btn prev accessories_prev">{l s='Prev' d='Modules.accessories.Shop'}</a>
                                <a class="btn next accessories_next">{l s='Next' d='Modules.accessories.Shop'}</a>
                            </div>
                        {/if}

                    </div>
                    <div class="products row">
                        {foreach from=$accessories item="product_accessory"}
                            {block name='product_miniature'}
                                {include file='catalog/_partials/miniatures/product.tpl' product=$product_accessory}
                            {/block}
                        {/foreach}
                    </div>
                </section>
            {/if}
        {/block}

        {block name='product_footer'}
            {hook h='displayFooterProduct' product=$product category=$category}
        {/block}

        {block name='product_images_modal'}
            {include file='catalog/_partials/product-images-modal.tpl'}
        {/block}

        {block name='page_footer_container'}
            <footer class="page-footer">
                {block name='page_footer'}
                    <!-- Footer content -->
                {/block}
            </footer>
        {/block}
    </section>

{/block}
