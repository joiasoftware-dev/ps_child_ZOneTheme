<?php
require_once _PS_MODULE_DIR_ . 'crazyelements/includes/plugin.php';
use CrazyElements\PrestaHelper;
if (!defined('_PS_VERSION_')) {
    exit;
}
class AdminCrazyCategoriesController extends ModuleAdminController
{
    public function initContent() {
		return parent::initContent();
	}
    public function renderList() {
		$html = "";
        $html.='<div class="panel col-lg-12">
        <div class="font-prev-wrapper" style="text-align: center;">
        <h2>You Need The Pro Version to Edit Product Category Description. <a style="color: blue;" href="https://classydevs.com/prestashop-page-builder/pricing/?utm_source=crazyfree_catg&utm_medium=crazyfree_module_catg&utm_campaign=crazyfree_catg&utm_term=crazyfree_catg&utm_content=crazyfree_products?utm_source=crazyfree_catg&utm_medium=crazyfree_module_catg&utm_campaign=crazyfree_catg&utm_term=crazyfree_catg&utm_content=crazyfree" target="_blank">Get PRO</a></h2><br>
        <a  href="https://classydevs.com/prestashop-page-builder/pricing/?utm_source=crazyfree_catg&utm_medium=crazyfree_module_catg&utm_campaign=crazyfree_catg&utm_term=crazyfree_catg&utm_content=crazyfree_products?utm_source=crazyfree_catg&utm_medium=crazyfree_module_catg&utm_campaign=crazyfree_catg&utm_term=crazyfree_catg&utm_content=crazyfree" target="_blank"> <img src=" ' . CRAZY_ASSETS_URL . 'images/price_compare.png" width="1200"></a></div></div>';
        return $html;
	}
}