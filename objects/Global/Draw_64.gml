/// @description Draw debug info

if (instance_exists(obj_player)) {

	draw_set_font(fnt_main);
	draw_set_color(c_black);
	draw_set_alpha(0.3);
	draw_rectangle(global.cam_min_x, global.cam_min_y, global.cam_min_x + 256, global.cam_min_y + 64, false);
	draw_set_color(c_white);
	draw_set_alpha(1);
	//draw_text(global.cam_min_x + 16, global.cam_min_y + 16, "x: " + string(x) + " y: " + string(y));
	//draw_text(global.cam_min_x + 16, global.cam_min_y + 32, "cam_min_x: " + string(global.cam_min_x) + " cam_max_x: " + string(global.cam_max_x));
	//draw_text(global.cam_min_x + 16, global.cam_min_y + 48, "cam_min_y: " + string(global.cam_min_y) + " cam_max_y: " + string(global.cam_max_y));
	draw_text(global.cam_min_x + 16, global.cam_min_y + 16, "alarm[2]: " + string(obj_player.alarm[2]));

}