var cam = view_camera[view_current];
global.cam_min_x = camera_get_view_x(cam);
global.cam_max_x = global.cam_min_x + camera_get_view_width(cam);
global.cam_min_y = camera_get_view_y(cam);
global.cam_max_y = global.cam_min_y + camera_get_view_height(cam);