// X input
var x_input = keyboard_check(vk_right) - keyboard_check(vk_left);

// X velocity
if (x_input != 0) {
    x_vel += x_accel * x_input;
} else if (abs(x_vel) > x_accel) {
    x_vel -= x_accel * sign(x_vel);
} else {
    x_vel = 0;
}
x_vel = clamp(x_vel, -max_x_speed, max_x_speed);

// X movement
var check_from_bbox = get_movement_bbox(bbox_left, bbox_right, x_vel);
if (collision_tile_meeting(check_from_bbox + x_vel, y)) {
    while (!collision_tile_meeting(check_from_bbox + sign(x_vel), y)) {
        x += sign(x_vel);
        check_from_bbox = get_movement_bbox(bbox_left, bbox_right, x_vel);
    }
    x_vel = 0;
} else {
    x += x_vel;
}

// Y velocity
var grounded = collision_tile_meeting(x, bbox_bottom + 1);
if (grounded) {
    y_vel = 0;
} else {
    y_vel += grav;
}

if (keyboard_check_pressed(ord("Z")) && grounded && !speaking) {
    y_vel = -jump_speed;
}
y_vel = clamp(y_vel, -jump_speed, max_y_speed);

// Y movement
check_from_bbox = get_movement_bbox(bbox_top, bbox_bottom, y_vel);
if (collision_tile_meeting(x, check_from_bbox + y_vel)) {
    while (!collision_tile_meeting(x, check_from_bbox + sign(y_vel))) {
        y += sign(y_vel);
        check_from_bbox = get_movement_bbox(bbox_top, bbox_bottom, y_vel);
    }
    y_vel = 0;
} else {
    y += y_vel;
}


// Wrap around the room
if (x < 0) {
    x = room_width;
} else if (x > room_width) {
    x = 0;
}
if (y < 0) {
    y = room_height;
} else if (y > room_height) {
    y = 0;
}


// Animation
if (grounded) {
    if (x_input == 0) {
        sprite_index = spr_player_idle;
    } else {
        sprite_index = spr_player_run;
    }
} else {    // In the air
    if (y_vel < 0) {
        sprite_index = spr_player_jump;
    } else {
        sprite_index = spr_player_fall;
    }
}
if (x_input != 0) {
    image_xscale = sign(x_input);
}