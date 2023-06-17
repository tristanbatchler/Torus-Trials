grounded = collision_tile_meeting(x, y + 1);

if (grounded) {
	y_vel = 0;
} else {
	y_vel += grav;
}

y_vel = clamp(y_vel, 0, max_y_speed);

wrap_room();

// X movement
if (collision_tile_meeting(x + x_vel, y-1)) {	// The -1 is because if the ball is placed on the ground to begin, it just keeps flipping between + and - vel and doesn't move...
    while (!collision_tile_meeting(x + sign(x_vel), y)) {
        x += sign(x_vel);
    }
    x_vel *= -1;
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