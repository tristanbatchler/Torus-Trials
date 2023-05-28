///@description get_movement_bbox(bbox_negative, bbox_positive, velocity)
///@param bbox_negative
///@param bbox_positive
///@param moving_horizontally
///@param velocity

var bbox_negative = argument0;
var bbox_positive = argument1;
var velocity = argument2;

var bbox = bbox_positive;

if (velocity < 0) {
	bbox = bbox_negative;
}

return bbox;