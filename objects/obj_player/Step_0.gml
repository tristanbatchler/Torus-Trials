// X input
var x_input = keyboard_check(vk_right) - keyboard_check(vk_left);

// X velocity
if (x_input != 0) {
    x_vel += x_accel * x_input;
} else if (abs(x_vel) > x_accel) {
    x_vel -= x_decel * sign(x_vel);
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
var almost_grounded = false;
if (!collision_tile_meeting(x, bbox_bottom + 1)) {
	if (grounded) {
		// The player has just become ungrounded
		if (y_vel >= 0) {
			// Allow coyote jump for 0.15 seconds
			alarm[2] = room_speed * 0.15;
		}
	}
	
	grounded = false;
	
	// Give some leeway if the player taps the jump button too soon while falling
	if (y_vel > 0 && collision_tile_meeting(x, bbox_bottom + 2*y_vel)) {
		almost_grounded = true;	
	}
} else {
	grounded = true;
}

if (grounded) {
    y_vel = 0;
} else {
    y_vel += grav;
}


var can_jump = (grounded || almost_grounded || (alarm[2] > 0 && y_vel >= 0)) && !speaking;
if (keyboard_check_pressed(ord("Z")) && can_jump) {
    y_vel = -jump_speed;
}
// Allow holding Z to jump higher, while tapping Z for smaller jumps
if (keyboard_check_released(ord("Z")) && y_vel < 0) {
	y_vel /= jump_release_decay_factor;	
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