// X input
var x_input = keyboard_check(vk_right) - keyboard_check(vk_left);

// X velocity
if (x_input != 0) {
    x_vel += (climbing ? 1 : x_accel) * x_input;
} else if (abs(x_vel) > x_accel) {
    x_vel -= x_decel * sign(x_vel);
} else {
    x_vel = 0;
}
x_vel = clamp(x_vel, -max_x_speed, max_x_speed);

// Y velocity
var almost_grounded = false;
if (!collision_tile_meeting(x, y + 1)) {
	if (grounded) {
		// The player has just become ungrounded
		if (y_vel >= 0) {
			// Allow coyote jump for 0.15 seconds
			alarm[2] = room_speed * 0.15;
		}
	}
	
	grounded = false;
	
	// Give some leeway if the player taps the jump button too soon while falling
	if (y_vel > 0 && collision_tile_meeting(x, y + 2*y_vel)) {
		almost_grounded = true;	
	}
} else {
	grounded = true;
}

if (!climbing) {
	if (grounded) {
	    y_vel = 0;
	} else {
	    y_vel += grav;
	}
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


// X movement
if (collision_tile_meeting(x + x_vel, y)) {
    while (!collision_tile_meeting(x + sign(x_vel), y)) {
        x += sign(x_vel);
    }
    x_vel = 0;
} else {
    x += x_vel;
}

// Y movement
if (collision_tile_meeting(x, y + y_vel)) {
    while (!collision_tile_meeting(x, y + sign(y_vel))) {
        y += sign(y_vel);
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


// Ladder logic
if (place_meeting(x, y, obj_ladder)) {
    if (!climbing && (keyboard_check(vk_up) || keyboard_check(vk_down))) {
        climbing = true;
    }
} else {
    climbing = false;
}

if (climbing) {
    var ladder_nearest = instance_nearest(x, y, obj_ladder);
    // Horizontally snap to ladder with a gentle force
	var force_mag = abs(ladder_nearest.x - x) * ladder_snap_force_factor;
	force_mag = min(max_ladder_snap_force, force_mag);
    x_vel += force_mag * sign(ladder_nearest.x - x);

    // Overcome the ladder snap force by pressing left/right
    if (keyboard_check_released(vk_left) || keyboard_check_released(vk_right) && abs(x_vel) > x_accel) {
        x_vel /= ladder_snap_release_factor;
    }
    
    var y_input = keyboard_check(vk_down) - keyboard_check(vk_up);
    if (y_input != 0) {
        y_vel += climb_accel * y_input;
    } else if (abs(y_vel) > climb_accel) {
        y_vel -= climb_decel * sign(y_vel);
    } else {
        y_vel = 0;
    }
    y_vel = clamp(y_vel, -max_climb_speed, max_climb_speed);

    // Jump to exit ladder
    if (keyboard_check_pressed(ord("Z"))) {
        climbing = false;
        y_vel = -jump_speed;
    }
}

// Key collection: see -><- obj_key event

// Door stuff
var touching_door = instance_place(x + x_vel, y + y_vel, obj_door);
if (touching_door != noone && num_keys > 0 && !touching_door.opened) {
	num_keys -= 1;
	with (touching_door) {
		opened = true;
		// Make the door passable (set par_solid mask to nothing)
		var par = object_get_parent(object_index);
		with (par) {
			mask_index = spr_nothing;	
		}
		image_speed = 0.3;
	}
}

// Cage stuff
var touching_cage = instance_place(x + x_vel, y + y_vel, obj_cage);
if (touching_cage != noone && num_keys > 0) {
	num_keys -= 1;
	with (touching_cage) {
		var touching_goal = instance_place(x, y, obj_goal);
		if (touching_goal == noone) {
			show_message("This is really bad, there should never be a cage that's not on a goal");
			game_end(-1);
		}
		touching_goal.locked = false;
		instance_destroy(self);
	}
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