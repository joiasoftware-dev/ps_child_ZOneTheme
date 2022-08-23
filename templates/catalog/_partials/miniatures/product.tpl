{**
 * 2007-2017 PrestaShop
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Open Software License (OSL 3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * http://opensource.org/licenses/osl-3.0.php
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
 * @copyright 2007-2017 PrestaShop SA
 * @license   http://opensource.org/licenses/osl-3.0.php Open Software License (OSL 3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}

{block name='product_miniature_item'}
<article class="product-miniature product-style js-product-miniature" data-id-product="{$product.id_product}" data-id-product-attribute="{$product.id_product_attribute}" data-product-id-category="{$product.id_category_default}" data-product-id-manufacturer="{$product.id_manufacturer}" itemscope itemtype="https://schema.org/Product">
  <div class="product-container {if !$product.cover}no-image{/if}">
    <div class="first-block">
      {block name='product_thumbnail'}
        {if $product.cover}
          {if !isset($image_type) || !array_key_exists($image_type, $product.cover.bySize)}
            {assign var='image_type' value='home_default'}
          {/if}
          {assign var=thumbnail value=$product.cover.bySize.$image_type}
        {/if}

        <div class="product-thumbnail">
          <a href="{$product.url}" class="product-cover-link">
            {if isset($thumbnail)}
              <img
                src       = "{$thumbnail.url}"
                alt       = "{$product.cover.legend|default: $product.name}"
                class     = "img-fluid"
                itemprop  = "image"
                width     = "{$thumbnail.width}"
                height    = "{$thumbnail.height}"
                data-full-size-image-url = "{$product.cover.large.url}"
              >
            {else}
              <span class="no-thumbnail"></span>
            {/if}
          </a>
        </div>
      {/block}

      {block name='product_flags'}
        <div class="product-flags">
          {if $product.has_discount && $product.discount_type === 'percentage'}
            <a class="product-flag discount discount-p" href="{$product.url}"><span>{$product.discount_percentage}</span></a>
          {/if}
          {if $product.flags}
            {foreach from=$product.flags item=flag}
              <a class="product-flag {$flag.type}" href="{$product.url}"><span>{$flag.label}</span></a>
            {/foreach}
          {/if}
        </div>
      {/block}

      {block name='grid_hover'}
        <div class="grid-hover">
          <div class="grid-hover-btn">
            <a
              href="{$product.url}"
              class="quick-view"
              data-link-action="quickview"
              title="{l s='Quick view' d='Shop.Theme.Actions'}"
              data-toggle="tooltip"
              data-placement="top"
            >
              <i class="fa fa-eye" aria-hidden="true"></i>
              <div class="js-waitting-add-to-cart page-loading-overlay quickview-loading">
                <div class="page-loading-backdrop d-flex align-items-center justify-content-center">
                  <div class="uil-spin-css"><div><div></div></div><div><div></div></div><div><div></div></div><div><div></div></div><div><div></div></div><div><div></div></div><div><div></div></div><div><div></div></div></div>
                </div>
              </div>
            </a>
          </div>
        </div>
      {/block}
    </div><!-- /first-block -->

    <div class="second-block">
      {block name='product_name'}
        <h5 class="product-name d-none" itemprop="name">
          <a href="{$product.url}" itemprop="url">{$product.name}</a>
        </h5>
        <h5 class="product-reference text-center" itemprop="name">
          <a href="{$product.url}" itemprop="url">{$product.reference}</a>
        </h5>
      {/block}

      <div class="second-block-wrapper">
        <div class="informations-section">
          <div class="price-and-status d-flex flex-wrap align-items-center">
            {block name='product_price_and_shipping'}
              {if $product.show_price}
                <div class="product-price-and-shipping d-flex flex-wrap align-items-center" itemprop="offers" itemscope itemtype="https://schema.org/Offer">
                  <div class="first-prices d-flex flex-wrap align-items-center">
                    {hook h='displayProductPriceBlock' product=$product type="before_price"}

                    <span class="price product-price" itemprop="price" content="{$product.price_amount}">{$product.price}</span>
                  </div>

                  {if $product.has_discount}
                  <div class="second-prices d-flex flex-wrap align-items-center">
                    {hook h='displayProductPriceBlock' product=$product type="old_price"}

                    <span class="regular-price">{$product.regular_price}</span>

                    {if $product.discount_type === 'percentage'}
                      <span class="discount-product discount-percentage">{$product.discount_percentage}</span>
                    {elseif $product.discount_type === 'amount'}
                      <span class="discount-product discount-amount">{$product.discount_amount_to_display}</span>
                    {/if}
                  </div>
                  {/if}

                  <div class="third-prices d-flex flex-wrap align-items-center">
                    {hook h='displayProductPriceBlock' product=$product type="unit_price"}
                    {hook h='displayProductPriceBlock' product=$product type="weight"}
                  </div>

                  {if $product.allow_oosp || $product.quantity > 0}
                    <link itemprop="availability" href="https://schema.org/InStock" />
                  {/if}
                  {if isset($currency)}<meta itemprop="priceCurrency" content="{$currency.iso_code}">{/if}
                </div>
              {/if}
            {/block}

            {block name='product_availability'}
              {if $product.show_availability && $product.availability_message}
                <div class="product-availability">
                  <span class='{$product.availability}'>{$product.availability_message}</span>
                </div>
              {/if}
            {/block}
          </div>

          {block name='product_reviews'}
            {hook h='displayProductListReviews' product=$product}
          {/block}

          {block name='product_description_short'}
            <div class="product-description-short" itemprop="description">{$product.description_short nofilter}</div>
          {/block}

          {block name='product_variants'}
            {if $product.main_variants}
              {include file='catalog/_partials/variant-links.tpl' variants=$product.main_variants}
            {/if}
          {/block}
        </div>
        <div class="buttons-sections">
          {block name='product_grid_buy'}
            <div class="grid-buy-button">
              {if 
                $product.available_for_order
                && $product.add_to_cart_url
                && ($product.allow_oosp || $product.quantity > 0)
                && $product.minimal_quantity == 1
                && $product.customizable == 0
              }
                <a
                  class="btn add-to-cart js-ajax-add-to-cart" 
                  href="{$product.url}"
                  data-id-product="{$product.id_product}"
                >
                  <span>{l s='Buy' d='Shop.Zonetheme'}</span>
                  <div class="js-waitting-add-to-cart page-loading-overlay add-to-cart-loading">
                    <div class="page-loading-backdrop d-flex align-items-center justify-content-center">
                      <div class="uil-spin-css"><div><div></div></div><div><div></div></div><div><div></div></div><div><div></div></div><div><div></div></div><div><div></div></div><div><div></div></div><div><div></div></div></div>
                    </div>
                  </div>
                </a>
              {/if}
              <a class="btn add-to-cart details-link" href="{$product.url}">
                {* <span>{l s='Details' d='Shop.Zonetheme'}</span> *}
                <span>{$product.availability_message}</span>
              </a>
            </div>
          {/block}

          {block name='product_add_to_cart'}
            <div class="add-to-cart-button">
            <span class="d-none">{$product|json_encode}</span>
              {if 
                $product.available_for_order
                && $product.add_to_cart_url
                && ($product.allow_oosp || $product.quantity > 0)
                && $product.minimal_quantity == 1
                && (!isset($product.product_attribute_minimal_quantity) || (isset($product.product_attribute_minimal_quantity) && $product.product_attribute_minimal_quantity == 1))
                && $product.customizable == 0
              }

                <a
                  class="btn add-to-cart js-ajax-add-to-cart" 
                  href="{$product.url}"
                  data-id-product="{$product.id_product}"
                >
                  <i class="fa fa-plus" aria-hidden="true"></i><span>{l s='Add to cart' d='Shop.Theme.Actions'}</span>
                  <div class="js-waitting-add-to-cart page-loading-overlay add-to-cart-loading">
                    <div class="page-loading-backdrop d-flex align-items-center justify-content-center">
                      <div class="uil-spin-css"><div><div></div></div><div><div></div></div><div><div></div></div><div><div></div></div><div><div></div></div><div><div></div></div><div><div></div></div><div><div></div></div></div>
                    </div>
                  </div>
                </a>
              {/if}
              <a class="btn add-to-cart details-link" href="{$product.url}">
                <span>{l s='View details' d='Shop.Zonetheme'}</span> &nbsp;<i class="caret-right"></i>
              </a>
            </div>
          {/block}

          {block name='product_actions'}
            <div class="product-actions">
              {hook h='displayProductListFunctionalButtons' product=$product}
            </div>
          {/block}
        </div>
      </div>
    </div><!-- /second-block -->
  </div><!-- /product-container -->
</article>
{/block}
