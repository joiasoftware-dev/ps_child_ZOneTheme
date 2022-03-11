<?php
namespace CrazyElements;

if ( ! defined( '_PS_VERSION_' ) ) {
	exit; // Exit if accessed directly.
}
use CrazyElements\Modules\DynamicTags\Module as TagsModule;

use CrazyElements\PrestaHelper;
use CrazyElements\Widget_Base;
use CrazyElements\Controls_Manager;
use CrazyElements\Core\Schemes;
class Widget_AnimateText extends Widget_Base {


	public function get_name() {
		return 'ce_animation_text';
	}
	public function get_title() {
		return PrestaHelper::__( 'Animation text', 'elementor' );
	}
	public function get_icon() {
		return 'ceicon-animated';
	}
	public function get_categories() {
		return array( 'crazy_addons' );
	}
	protected function _register_controls() {
		$this->start_controls_section(
			'animation_content_area',
			array(
				'label' => PrestaHelper::__( 'Animation content', 'elementor' ),
				'tab'   => Controls_Manager::TAB_CONTENT,
			)
		);
		$this->add_control(
			'pro_alert',
			[
				'type' => Controls_Manager::RAW_HTML,
				'raw' => PrestaHelper::__( '<a href="https://classydevs.com/prestashop-page-builder/pricing/?utm_source=crazyfree&utm_medium=crazyfree_module&utm_campaign=crazyfree&utm_term=crazyfree&utm_content=crazyfree" target="_blank">Get The PRO</a> version of Crazy Elements to Use This Awesome Addons.', 'elementor' ),
				'content_classes' => 'elementor-panel-alert elementor-panel-alert-danger',
			]
		);
		$this->end_controls_section();
	}
	protected function render() {
		$settings       = $this->get_settings_for_display();
		echo "You are using the Free Version of Crazy Elements. <a href='https://classydevs.com/prestashop-page-builder/pricing/?utm_source=crazyfree&utm_medium=crazyfree_module&utm_campaign=crazyfree&utm_term=crazyfree&utm_content=crazyfree' target='_blank'>Get Pro to use this feature.</a>";
	}
}