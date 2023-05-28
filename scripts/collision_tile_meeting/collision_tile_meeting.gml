///@description collision_tile_meeting(meeting_x, meeting_y)
///@param meeting_x
///@param meeting_y
///@param object_checking

var meeting_x = argument0;
var meeting_y = argument1;

// If meeting_x and meeting_y are out of bounds, return false
if (meeting_x < 0 || meeting_x > room_width || meeting_y < 0 || meeting_y > room_height) {
	return false;
}

var tilemap_id = layer_tilemap_get_id("Collision");
var collision_data = tilemap_get_at_pixel(tilemap_id, meeting_x, meeting_y);

return (collision_data != 0);