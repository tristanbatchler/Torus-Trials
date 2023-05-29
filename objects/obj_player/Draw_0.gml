draw_self();

// When the player is half way between transitioning, draw another partial view of the sprite on the other side of the screen (for aesthetics)
var half_spr_w = abs(sprite_width / 2);
if (x < global.cam_min_x + half_spr_w) {
    draw_sprite_ext(sprite_index, image_index, x + global.cam_max_x - half_spr_w, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
} else if (x > global.cam_max_x - half_spr_w) {
    draw_sprite_ext(sprite_index, image_index, x - global.cam_max_x + half_spr_w, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}

var half_spr_h = abs(sprite_height / 2);
if (y < global.cam_min_y + half_spr_h) {
    draw_sprite_ext(sprite_index, image_index, x, y + global.cam_max_y - half_spr_h, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
} else if (y > global.cam_max_y - half_spr_h) {
    draw_sprite_ext(sprite_index, image_index, x, y - global.cam_max_y + half_spr_h, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}

