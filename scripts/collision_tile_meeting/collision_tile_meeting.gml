///@description collision_tile_meeting(meeting_x, meeting_y)
///@param meeting_x
///@param meeting_y
///@param object_checking

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

// if (meeting_x < global.cam_min_x || meeting_x > global.cam_max_x || meeting_y < global.cam_min_y || meeting_y > global.cam_max_y) {
// 	return false;
// }

var tilemap_id = layer_tilemap_get_id("Collision");
var collision_data = tilemap_get_at_pixel(tilemap_id, meeting_x, meeting_y);

return (collision_data != 0);