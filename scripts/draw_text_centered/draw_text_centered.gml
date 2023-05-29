///@description draw_text_centered(center_x, center_y, text)
///@param center_x
///@param center_y
///@param text

function draw_text_centered(center_x, center_y, text) {

	draw_set_font(fnt_main);
	var half_str_w = string_width(text) / 2;
	var half_str_h = string_height(text) / 2;

	draw_text(center_x - half_str_w, center_y - half_str_h, text);

}