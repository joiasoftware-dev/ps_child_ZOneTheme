{**
 * ADD EAN after Reference
 *}
{block name='product_reference' append}
  {if isset($product.ean13)}
    <div class="attribute-item product-ean">
      <label>{l s='Barcode' d='Shop.Theme.Catalog'} </label>
      <span itemprop="ean">{$product.ean13}</span>
    </div>
  {/if}
{/block}
