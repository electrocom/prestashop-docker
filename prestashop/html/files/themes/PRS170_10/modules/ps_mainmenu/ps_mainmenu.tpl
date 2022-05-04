{assign var=_counter value=0}
{function name="menu" nodes=[] depth=0 parent=null}
    {if $nodes|count}
      <ul class="top-menu" {if $depth == 0}id="top-menu"{/if} data-depth="{$depth}">
        {foreach from=$nodes item=node}
            <li class="{$node.type}{if $node.current} current {/if}" id="{$node.page_identifier}">
            {assign var=_counter value=$_counter+1}
              <a
                class="{if $depth >= 0}dropdown-item{/if}{if $depth === 1} dropdown-submenu{/if}"
                href="{$node.url}" data-depth="{$depth}"
                {if $node.open_in_new_window} target="_blank" {/if}
              >
                {if $node.children|count}
                  {* Cannot use page identifier as we can have the same page several times *}
                  {assign var=_expand_id value=10|mt_rand:100000}
                  <span class="float-xs-right hidden-md-up">
                    <span data-target="#top_sub_menu_{$_expand_id}" data-toggle="collapse" class="navbar-toggler collapse-icons">
                      <i class="material-icons add">&#xE313;</i>
                      <i class="material-icons remove">&#xE316;</i>
					  <i class="material-icons add-down">&#xE5CC;</i>
                    </span>
                  </span>
                {/if}
                {$node.label}
              </a>
              {if $node.children|count}
              <div {if $depth === 0} class="popover sub-menu js-sub-menu collapse"{else} class="collapse"{/if} id="top_sub_menu_{$_expand_id}">
					{menu nodes=$node.children depth=$node.depth parent=$node}
					{if $node.image_urls|count}
						<div class="menu-images-container">
							{foreach from=$node.image_urls item=image_url}
								<img src="{$image_url}" alt="">
							{/foreach}
						</div>
					{/if}
              </div>
              {/if}
            </li>
        {/foreach}
			{if $depth == 0}
			{if Module::isInstalled("smartblog") && Module::isInstalled("smartbloghomelatestnews") && (Module::isEnabled("smartblog")) && (Module::isEnabled("smartbloghomelatestnews"))}
			<li class="ttblog">
			<a class="dropdown-item" href="{$link->getPageLink('smartblog')|escape:'html':'UTF-8'}" data-depth="{$depth}">{l s='blog' d='Shop.Theme.Global'}</a>
			</li>
			{/if}
			{/if}
      </ul>
    {/if}
{/function}

<div class="topmenu col-sm-3">
<div class="topdropdownmenu">
	<h4 class="title_block">
	<span>{l s='Shop Categories' d='Shop.Theme.Global'}</span>
	<i class="material-icons top-menu-icon">&#xE5D2;</i>
	</h4>
	<div class="menu js-top-menu hidden-sm-down" id="_desktop_top_menu">
		{menu nodes=$menu.children}
		<div class="clearfix"></div>
	</div>
</div>
</div>