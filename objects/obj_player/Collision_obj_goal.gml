if (!other.locked) {
	// Lerp position to other
	x = lerp(x, other.x, 0.1);
	y = lerp(y, other.y, 0.1);

	// Set timer for 2 seconds
	if (alarm[0] <= 0) {
	    alarm[0] = room_speed * 2;
	}		
}