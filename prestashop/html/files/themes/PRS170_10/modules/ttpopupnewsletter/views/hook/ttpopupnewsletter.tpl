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
 
<div id="ttPopupnewsletter" class="modal fade" tabindex="-1" role="dialog">
	<div class="ttPopupnewsletter-i" role="document" style="">
		<div class="ttpopupnewsletter" style="{if $tt_popupnewlestter.TT_HEIGHT}height:{$tt_popupnewlestter.TT_HEIGHT}px;{/if}{if $tt_popupnewlestter.TT_WIDTH}max-width:{$tt_popupnewlestter.TT_WIDTH}px;{/if}">
		
			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				<i class="material-icons">&#xE14C;</i>
				<span>close</span>
			</button>
		
			{if $tt_popupnewlestter.TT_NEWSLETTER == 1}
				<div id="newsletter_block_popup" class="block">
					<div class="block_content">
						{if isset($msg) && $msg}
						<p class="{if $nw_error}warning_inline{else}success_inline{/if}">{$msg}</p>
						{/if}
						<div class="ttnewslatterpopup-img col-sm-6">
							<img src="{$tt_popupnewlestter.TT_BG_IMAGE}"  class="img" alt="bg-img"/>
						</div>
						<div class="ttnewslatterpopup-content col-sm-6">
							<form method="post">
								{if $tt_popupnewlestter.TT_TITLE}
									<div class="newsletter_title">
										<h3 class="h3">{$tt_popupnewlestter.TT_TITLE|stripslashes nofilter}</h3>
									</div>
								{/if}
								
								{if $tt_popupnewlestter.TT_TEXT}
									<div class="ttContent">
										{$tt_popupnewlestter.TT_TEXT|stripslashes nofilter}
									</div>
								{/if}
								<div class="ttAlert"></div>
								
								<input class="inputNew" id="ttnewsletter-input" type="text" name="email" placeholder="{l s='Enter your mail...' mod='ttpopupnewsletter'}"/>
								
								<div class="send-reqest button_unique btn-primary">{l s='Subscribe!' mod='ttpopupnewsletter'}</div>
							</form>
							
							<div class="newsletter_block_popup-bottom">
								<div class="subscribe-bottom">	
									<input id="tt_newsletter_dont_show_again" type="checkbox">
								</div>
								
								<label class="tt_newsletter_dont_show_again" for="tt_newsletter_dont_show_again">{l s='Do not show this popup again' mod='ttpopupnewsletter'}</label>
							</div>
						</div>
					</div>
				</div>
			{/if}
		</div>
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->



{if $tt_popupnewlestter.TT_NEWSLETTER == 1}

<script type="text/javascript">
    var placeholder2 = "{l s='Enter your mail...' mod='ttpopupnewsletter' js=1}";
    {literal}
 var elem = document.createElement('script');
elem.onload = function () {
        $(document).ready(function() {
            $('#ttnewsletter-input').on({
                focus: function() {
                    if ($(this).val() == placeholder2) {
                        $(this).val('');
                    }
                },
                blur: function() {
                    if ($(this).val() == '') {
                        $(this).val(placeholder2);
                    }
                }
            });
        });
    };

    {/literal}
</script>
{/if}

<script type="text/javascript">
var field_width={$tt_popupnewlestter.TT_WIDTH};
var field_height={$tt_popupnewlestter.TT_HEIGHT};
var field_newsletter={$tt_popupnewlestter.TT_NEWSLETTER};
var field_path='{$tt_popupnewlestter.TT_PATH}';
</script>

