///@description collision_tile_meeting(meeting_x, meeting_y)
///@param meeting_x
///@param meeting_y
///@param object_checking

var meeting_x = argument0;
var meeting_y = argument1;

var tilemap_id = layer_tilemap_get_id("Collision");
var collision_data = tilemap_get_at_pixel(tilemap_id, meeting_x, meeting_y);

return collision_data != 0;