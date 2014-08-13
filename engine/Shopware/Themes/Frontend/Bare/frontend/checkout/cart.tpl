{extends file='frontend/index/index.tpl'}

{* Title *}
{block name='frontend_index_header_title'}
	{s name="CartTitle"}{/s} | {config name=shopName}
{/block}

{* Hide breadcrumb *}
{block name='frontend_index_breadcrumb'}{/block}

{* Step Box *}
{block name="frontend_index_content_top"}{/block}

{* Main content *}
{block name='frontend_index_content'}
<div class="content block content--basket content--checkout">

    {* If articles are in the basket... *}
    {if $sBasket.content}

        {* Add article informations *}
        {block name='frontend_checkout_add_article'}
            <noscript>
                {include file='frontend/checkout/added.tpl'}
            </noscript>
        {/block}

        {* Product table *}
        {block name='frontend_checkout_cart_table'}
            <div class="product--table {if {config name=BasketShippingInfo}} has--dispatch-info{/if}">

                {* Deliveryfree dispatch notification *}
                {block name='frontend_checkout_cart_deliveryfree'}
                    {if $sShippingcostsDifference}
                        {$shippingDifferenceContent="<strong>{s name='CartInfoFreeShipping'}{/s}</strong> {s name='CartInfoFreeShippingDifference'}{/s}"}
                        {include file="frontend/_includes/messages.tpl" type="warning" content="{$shippingDifferenceContent}"}
                    {/if}
                {/block}

                {* Error messages *}
                {block name='frontend_checkout_cart_error_messages'}
                    {include file="frontend/checkout/error_messages.tpl"}
                {/block}

                {block name='frontend_checkout_cart_table_actions'}
                    <div class="table--actions">

                        <div class="main--actions">
                            {* Continue shopping *}
                            {if $sBasket.sLastActiveArticle.link}
                                {block name="frontend_checkout_actions_link_last"}
                                    <a href="{$sBasket.sLastActiveArticle.link}" title="{"{s name='CheckoutActionsLinkLast' namespace="frontend/checkout/actions"}{/s}"|escape}" class="btn btn--secondary left continue-shopping--action">
                                        <i class="icon--arrow-left is--small"></i>{s name="CheckoutActionsLinkLast" namespace="frontend/checkout/actions"}{/s}
                                    </a>
                                {/block}
                            {/if}

                            {block name="frontend_checkout_actions_confirm"}

                                {* Forward to the checkout *}
                                {if !$sMinimumSurcharge && !$sDispatchNoOrder}
                                    {block name="frontend_checkout_actions_checkout"}
                                        <a href="{url action=confirm}" title="{"{s name='CheckoutActionsLinkProceedShort' namespace="frontend/checkout/actions"}{/s}"|escape}" class="btn btn--primary right">
                                            {s name="CheckoutActionsLinkProceedShort" namespace="frontend/checkout/actions"}{/s} <i class="icon--arrow-right is--small"></i>
                                        </a>
                                    {/block}
                                {/if}
                            {/block}
                        </div>
                    </div>
                {/block}

                {* Product table content *}
                {block name='frontend_checkout_cart_panel'}
                    <div class="panel has--border">
                        <div class="panel--body">

                            {* Product table header *}
                            {block name='frontend_checkout_cart_cart_head'}
                                {include file="frontend/checkout/cart_header.tpl"}
                            {/block}

                            {* Basket items *}
                            {foreach $sBasket.content as $sBasketItem}
                                {block name='frontend_checkout_cart_item'}
                                    {include file='frontend/checkout/cart_item.tpl' isLast=$sBasketItem@last}
                                {/block}
                            {/foreach}

                            {* Product table footer *}
                            {block name='frontend_checkout_cart_cart_footer'}
                                {include file="frontend/checkout/cart_footer.tpl"}
                            {/block}
                        </div>
                    </div>
                {/block}

                {* Premium products *}
                {block name='frontend_checkout_cart_premium'}
                    {if $sPremiums}

                        {* Actual listing *}
                        {block name='frontend_checkout_cart_premium_products'}
                            {include file='frontend/checkout/premiums.tpl'}
                        {/block}
                    {/if}
                {/block}

                {block name='frontend_checkout_cart_table_actions_bottom'}
                    <div class="table--actions actions--bottom">
                        {block name="frontend_checkout_actions_confirm_bottom"}

                            <div class="main--actions">

                                {* Contiune shopping *}
                                {if $sBasket.sLastActiveArticle.link}
                                    {block name="frontend_checkout_actions_link_last_bottom"}
                                        <a href="{$sBasket.sLastActiveArticle.link}" title="{"{s name='CheckoutActionsLinkLast' namespace="frontend/checkout/actions"}{/s}"|escape}" class="btn btn--secondary is--left continue-shopping--action">
                                            <i class="icon--arrow-left is--small"></i> {s name="CheckoutActionsLinkLast" namespace="frontend/checkout/actions"}{/s}
                                        </a>
                                    {/block}
                                {/if}

                                {* Forward to the checkout *}
                                {if !$sMinimumSurcharge && !$sDispatchNoOrder}
                                    {block name="frontend_checkout_actions_confirm_bottom_checkout"}
                                        <a href="{url action=confirm}" title="{"{s name='CheckoutActionsLinkProceedShort' namespace="frontend/checkout/actions"}{/s}"|escape}" class="btn btn--primary right">
                                            {s name="CheckoutActionsLinkProceedShort" namespace="frontend/checkout/actions"}{/s} <i class="icon--arrow-right is--small"></i>
                                        </a>
                                    {/block}
                                {/if}
                            </div>

                            {if !$sMinimumSurcharge && ($sInquiry || $sDispatchNoOrder)}
                                {block name="frontend_checkout_actions_inquiry"}
                                    <a href="{$sInquiryLink}" title="{"{s name='CheckoutActionsLinkOffer' namespace="frontend/checkout/actions"}{/s}"|escape}" class="btn btn--secondary btn--inquiry">
                                        {s name="CheckoutActionsLinkOffer" namespace="frontend/checkout/actions"}{/s}
                                    </a>
                                {/block}
                            {/if}
                        {/block}
                    </div>
                {/block}

				{* Benefit and services footer *}
                {block name="frontend_checkout_footer"}
                    {include file="frontend/checkout/table_footer.tpl"}
                {/block}
            </div>
        {/block}

    {else}
        {* Empty basket *}
        {block name='frontend_basket_basket_is_empty'}
            <div class="basket--info-messages">
                {include file="frontend/_includes/messages.tpl" type="warning" content="{s name='CartInfoEmpty'}{/s}"}
            </div>
        {/block}
    {/if}
</div>
{/block}
