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
{assign var="tt_cnt" value="1"}
{assign var="tt_total" value="0"}
{foreach from=$products item="product"}
	{$tt_total = $tt_total+1}
{/foreach}

<section class="crossselling-product clearfix mt-3">
<div class="tt-titletab">
  <h2 class="tt-title">{l s='Customers who bought this product also bought:' d='Shop.Theme.Catalog'}</h2>
       {if $tt_total > 4}
	<div class="customNavigation">
		<a class="btn prev Crossselling_prev">{l s='Prev' d='Shop.Theme.Catalog'}</a>
		<a class="btn next Crossselling_next">{l s='Next' d='Shop.Theme.Catalog'}</a>
	</div>
  {/if}
</div>
  <div class="products row">
    {foreach from=$products item="product"}
      {include file="catalog/_partials/miniatures/product.tpl" product=$product}
    {/foreach}
  </div>
</section>
