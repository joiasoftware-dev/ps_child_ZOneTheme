{**
 * RIMUOVE sorepage e suppler page
 *}
{block name='sitemap_item'}
  <ul class="{if isset($is_nested)}nested{else}tree{/if}">
    {foreach $links as $link}
      {if $link.id != "stores-page" && $link.id!="supplier-page"}
      <li class="{$link.id}">
        <a id="{$link.id}" href="{$link.url}" title="{$link.label}">
          {$link.label}
        </a>
        {if isset($link.children) && $link.children|@count > 0 && $link.id!= "manufacturer-page"}
          {include file='cms/_partials/sitemap-nested-list.tpl' links=$link.children is_nested=true}
        {/if}
      </li>
      {/if}
    {/foreach}
  </ul>
{/block}
