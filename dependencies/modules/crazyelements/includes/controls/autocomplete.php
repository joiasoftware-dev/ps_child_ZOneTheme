<?php
namespace CrazyElements;

use CrazyElements\PrestaHelper; if ( ! defined( '_PS_VERSION_' ) ) {
	exit; // Exit if accessed directly.
}

/**
 *
 * A base control for creating select2 control. Displays a select box control
 * based on select2 jQuery plugin @see https://select2.github.io/ .
 * It accepts an array in which the `key` is the value and the `value` is the
 * option name. Set `multiple` to `true` to allow multiple value selection.
 *
 * @since 1.0.0
 */
class Control_Autocomplete extends Base_Data_Control {




	private $selected_vals = array();
	private $current_id = 0;


	/**
	 * Get select2 control type.
	 *
	 * Retrieve the control type, in this case `select2`.
	 *
	 * @since  1.0.0
	 * @access public
	 *
	 * @return string Control type.
	 */
	public function get_type() {
		return 'autocomplete';
	}

	/**
	 * Get data control value.
	 *
	 * Retrieve the value of the data control from a specific Controls_Stack settings.
	 *
	 * @since  1.0.0
	 * @access public
	 *
	 * @param array $control  Control
	 * @param array $settings Element settings
	 *
	 * @return mixed Control values.
	 */
	public function get_value( $control, $settings ) {

		if ( ! isset( $control['default'] ) ) {
			$control['default'] = $this->get_default_value();
		}

		if ( isset( $settings[ $control['name'] ] ) ) {
			$value = $settings[ $control['name'] ];
		} else {
			$value = $control['default'];
		}
		$control_uid       = $this->get_control_uid();
	
		$this->selected_vals[$control_uid] = array(
				'value' => $value,
				'type' => $control['item_type'],
		);

		return $value;
	}

	/**
	 * Render select2 control output in the editor.
	 *
	 * Used to generate the control HTML in the editor using Underscore JS
	 * template. The variables for the class are available using `data` JS
	 * object.
	 *
	 * @since  1.0.0
	 * @access public
	 */
	public function content_template() {

		$control_uid       = $this->get_control_uid();
		$settings = $this->get_type();
		$selected_products = array();

		if ( isset( $this->selected_vals[$control_uid]['value'] ) && ! empty( $this->selected_vals[$control_uid]['value'] ) ) {
			$selected_products = $this->get_selected_items_by_id( $this->selected_vals[$control_uid]['type'], $this->selected_vals[$control_uid]['value'] );
		}
		?>
<div class="elementor-control-field">
    <# if ( data.label ) {#>
				<label for="<?php echo $control_uid; ?>" class="elementor-control-title">{{{ data.label }}}</label>
			<# } #>
				<div class="elementor-control-input-wrapper">
				<input type="hidden" id="crazy-autocomplte-type" value="{{{ data.item_type }}}">
				<input type="hidden" id="crazy-autocomplte-values" value="{{{ data.controlValue }}}">
				<# var multiple = ( data.multiple ) ? 'multiple' : ''; #>
					<select class="crazy-elements-autocomplte" {{ multiple }} type="select2"  data-setting="{{ data.name }}">
		<?php
		foreach ( $selected_products as  $key => $selected_product ) {
			?>
						<option  value="<?php echo $key; ?>"><?php echo $selected_product; ?></option>
			<?php
		}
		?>
					</select>
				</div>
		</div>
		<?php
	}
}