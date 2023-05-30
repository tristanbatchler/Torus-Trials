/// See the obj_player collision event to see handling of opening doors when colliding with player

var num_subimgs = sprite_get_number(sprite_index);

if (image_index >= num_subimgs - 1) {
	image_speed = 0;
	image_index = num_subimgs - 1;
}