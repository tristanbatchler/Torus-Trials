/// @description Draw sliders for each value in the create event, allowing user to play with the values for the overall feel of the platformer

// To disable the debug draws
exit


var x0 = global.cam_min_x + 128;
var y0 = global.cam_min_y + 128;
var slider_width = 128;


var max_x_speed_min = 0;
var max_x_speed_max = 10;

var max_y_speed_min = 0;
var max_y_speed_max = 20;

var jump_speed_min = 0;
var jump_speed_max = 20;

var x_accel_min = 0;
var x_accel_max = 2;

var x_decel_min = 0;
var x_decel_max = 2;

var grav_min = 0;
var grav_max = 5;

var jump_release_decay_factor_min = 1;
var jump_release_decay_factor_max = 5;

// Ladder stuff
ladder_snap_force_factor_min = 0.0;
ladder_snap_force_factor_max = 2.0;

max_ladder_snap_force_min = 0.0;
max_ladder_snap_force_max = 10.0;

ladder_snap_release_factor_min = 0.0;
ladder_snap_release_factor_max = 10.0;


var true_mouse_x = mouse_x * view_wport[view_current] / (global.cam_max_x - global.cam_min_x) - 2*global.cam_min_x;
var true_mouse_y = mouse_y * view_hport[view_current] / (global.cam_max_y - global.cam_min_y) - 2*global.cam_min_y;

draw_text(x0 - 128, y0, "maxXSpeed: " + string(max_x_speed));
draw_healthbar(x0, y0, x0 + slider_width, y0 + 16, max_x_speed / (max_x_speed_max - max_x_speed_min) * 100, c_black, c_red, c_green, 0, true, true);
if (true_mouse_x > x0 && true_mouse_x < x0 + slider_width && true_mouse_y > y0 && true_mouse_y < y0 + 16) {
    max_x_speed += (mouse_wheel_up() - mouse_wheel_down()) * (max_x_speed_max - max_x_speed_min)*0.01;
}

draw_text(x0 - 128, y0 + 32, "maxYSpeed: " + string(max_y_speed));
draw_healthbar(x0, y0 + 32, x0 + slider_width, y0 + 48, max_y_speed / (max_y_speed_max - max_y_speed_min) * 100, c_black, c_red, c_green, 0, true, true);
if (true_mouse_x > x0 && true_mouse_x < x0 + slider_width && true_mouse_y > y0 + 32 && true_mouse_y < y0 + 48) {
    max_y_speed += (mouse_wheel_up() - mouse_wheel_down()) * (max_y_speed_max - max_y_speed_min) * 0.01;
}

draw_text(x0 - 128, y0 + 64, "jumpSpeed: " + string(jump_speed));
draw_healthbar(x0, y0 + 64, x0 + slider_width, y0 + 80, jump_speed / (jump_speed_max - jump_speed_min) * 100, c_black, c_red, c_green, 0, true, true);
if (true_mouse_x > x0 && true_mouse_x < x0 + slider_width && true_mouse_y > y0 + 64 && true_mouse_y < y0 + 80) {
    jump_speed += (mouse_wheel_up() - mouse_wheel_down()) * (jump_speed_max - jump_speed_min) * 0.01;
}

draw_text(x0 - 128, y0 + 96, "xAccel: " + string(x_accel));
draw_healthbar(x0, y0 + 96, x0 + slider_width, y0 + 112, x_accel / (x_accel_max - x_accel_min) * 100, c_black, c_red, c_green, 0, true, true);
if (true_mouse_x > x0 && true_mouse_x < x0 + slider_width && true_mouse_y > y0 + 96 && true_mouse_y < y0 + 112) {
    x_accel += (mouse_wheel_up() - mouse_wheel_down()) * (x_accel_max - x_accel_min) * 0.01;
}

draw_text(x0 - 128, y0 + 128, "xDecel: " + string(x_decel));
draw_healthbar(x0, y0 + 128, x0 + slider_width, y0 + 144, x_decel / (x_decel_max - x_decel_min) * 100, c_black, c_red, c_green, 0, true, true);
if (true_mouse_x > x0 && true_mouse_x < x0 + slider_width && true_mouse_y > y0 + 128 && true_mouse_y < y0 + 144) {
    x_decel += (mouse_wheel_up() - mouse_wheel_down()) * (x_decel_max - x_decel_min) * 0.01;
}

draw_text(x0 - 128, y0 + 160, "grav: " + string(grav));
draw_healthbar(x0, y0 + 160, x0 + slider_width, y0 + 176, grav / (grav_max - grav_min) * 100, c_black, c_red, c_green, 0, true, true);
if (true_mouse_x > x0 && true_mouse_x < x0 + slider_width && true_mouse_y > y0 + 160 && true_mouse_y < y0 + 176) {
    grav += (mouse_wheel_up() - mouse_wheel_down()) * (grav_max - grav_min) * 0.01;
}

draw_text(x0 - 128, y0 + 192, "jumpDecay: " + string(jump_release_decay_factor));
draw_healthbar(x0, y0 + 192, x0 + slider_width, y0 + 208, jump_release_decay_factor / (jump_release_decay_factor_max - jump_release_decay_factor_min) * 100, c_black, c_red, c_green, 0, true, true);
if (true_mouse_x > x0 && true_mouse_x < x0 + slider_width && true_mouse_y > y0 + 192 && true_mouse_y < y0 + 208) {
    jump_release_decay_factor += (mouse_wheel_up() - mouse_wheel_down()) * (jump_release_decay_factor_max - jump_release_decay_factor_min) * 0.01;
}

// Ladder stuff
draw_text(x0 - 128, y0 + 224, "ldrFrceF: " + string(ladder_snap_force_factor));
draw_healthbar(x0, y0 + 224, x0 + slider_width, y0 + 240, ladder_snap_force_factor / (ladder_snap_force_factor_max - ladder_snap_force_factor_min) * 100, c_black, c_red, c_green, 0, true, true);
if (true_mouse_x > x0 && true_mouse_x < x0 + slider_width && true_mouse_y > y0 + 224 && true_mouse_y < y0 + 240) {
    ladder_snap_force_factor += (mouse_wheel_up() - mouse_wheel_down()) * (ladder_snap_force_factor_max - ladder_snap_force_factor_min) * 0.01;
}

draw_text(x0 - 128, y0 + 256, "maxLdrFrce: " + string(max_ladder_snap_force));
draw_healthbar(x0, y0 + 256, x0 + slider_width, y0 + 272, max_ladder_snap_force / (max_ladder_snap_force_max - max_ladder_snap_force_min) * 100, c_black, c_red, c_green, 0, true, true);
if (true_mouse_x > x0 && true_mouse_x < x0 + slider_width && true_mouse_y > y0 + 256 && true_mouse_y < y0 + 272) {
    max_ladder_snap_force += (mouse_wheel_up() - mouse_wheel_down()) * (max_ladder_snap_force_max - max_ladder_snap_force_min) * 0.01;
}

draw_text(x0 - 128, y0 + 288, "ldrFrceReleaseF: " + string(ladder_snap_release_factor));
draw_healthbar(x0, y0 + 288, x0 + slider_width, y0 + 304, ladder_snap_release_factor / (ladder_snap_release_factor_max - ladder_snap_release_factor_min) * 100, c_black, c_red, c_green, 0, true, true);
if (true_mouse_x > x0 && true_mouse_x < x0 + slider_width && true_mouse_y > y0 + 288 && true_mouse_y < y0 + 304) {
    ladder_snap_release_factor += (mouse_wheel_up() - mouse_wheel_down()) * (ladder_snap_release_factor_max - ladder_snap_release_factor_min) * 0.01;
}

// More debug
draw_text(x0 - 128, y0 + 320, "numKeys: " + string(num_keys));