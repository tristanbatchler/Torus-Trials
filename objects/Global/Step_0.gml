if (mouse_check_button_released(mb_left)) {
	var tilemap_id = layer_tilemap_get_id("Collision");
	var collision_data = tilemap_get_at_pixel(tilemap_id, mouse_x, mouse_y);
	show_message(string(collision_data));
}