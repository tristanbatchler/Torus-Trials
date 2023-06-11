var cam = view_camera[view_current];
global.cam_min_x = camera_get_view_x(cam);
global.cam_max_x = global.cam_min_x + camera_get_view_width(cam);
global.cam_min_y = camera_get_view_y(cam);
global.cam_max_y = global.cam_min_y + camera_get_view_height(cam);

var bg_layer = layer_get_id("Background");
var bg = layer_background_get_id(bg_layer);
layer_background_sprite(bg, bg_facility);
layer_background_visible(bg, true);
layer_background_vtiled(bg, true);
layer_background_htiled(bg, true);
layer_x(bg, 16);
layer_y(bg, 16);

// Scrolling fog effect
var fog_layer = layer_get_id("Fog");
var fog = layer_background_get_id(fog_layer);
layer_background_sprite(fog, bg_fog);
layer_background_visible(fog, true);
layer_background_vtiled(fog, true);
layer_background_htiled(fog, true);
layer_background_stretch(fog, 1.2);
layer_x(fog, 16);
layer_y(fog, 16);
layer_hspeed(fog_layer, 0.5);