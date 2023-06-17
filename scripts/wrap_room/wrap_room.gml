function wrap_room() {

if (x < global.cam_min_x) {
    x = global.cam_max_x;
} else if (x > global.cam_max_x) {
    x = global.cam_min_x;
}
if (y < global.cam_min_y) {
    y = global.cam_max_y;
} else if (y > global.cam_max_y) {
    y = global.cam_min_y;
}

}