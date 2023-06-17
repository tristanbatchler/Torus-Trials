grounded = collision_tile_meeting(x, y + 1);

if (grounded) {
	y_vel = 0;
} else {
	y_vel += grav;
}

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