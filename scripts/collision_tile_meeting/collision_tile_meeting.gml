///@description collision_tile_meeting(meeting_x, meeting_y)
///@param meeting_x
///@param meeting_y

// This script doesn't work unless global vars are set
if (!instance_exists(Global)) {
	return;
}

var meeting_x = argument0;
var meeting_y = argument1;

// If meeting_x and meeting_y are out of bounds, and there is no collision on the other side of the camera view, return false
if (meeting_x < global.cam_min_x) {
	return collision_tile_meeting(global.cam_max_x, meeting_y);
} else if (meeting_x > global.cam_max_x) {
	return collision_tile_meeting(global.cam_min_x, meeting_y);
}
if (meeting_y < global.cam_min_y) {
	return collision_tile_meeting(meeting_x, global.cam_max_y);
} else if (meeting_y > global.cam_max_y) {
	return collision_tile_meeting(meeting_x, global.cam_min_y);
}

// Script from https://gamemaker.io/en/blog/precise-tile-collisions-by-pixelated-pope
var _tm = layer_tilemap_get_id("Collision");

var _x1 = tilemap_get_cell_x_at_pixel(_tm, bbox_left + (meeting_x - x), y),
    _y1 = tilemap_get_cell_y_at_pixel(_tm, x, bbox_top + (meeting_y - y)),
    _x2 = tilemap_get_cell_x_at_pixel(_tm, bbox_right + (meeting_x - x), y),
    _y2 = tilemap_get_cell_y_at_pixel(_tm, x, bbox_bottom + (meeting_y - y));

for(var _x = _x1; _x <= _x2; _x++){
 for(var _y = _y1; _y <= _y2; _y++){
    if(tile_get_index(tilemap_get(_tm, _x, _y))){
		return true;
    }
 }
}

return place_meeting(meeting_x, meeting_y, par_solid);