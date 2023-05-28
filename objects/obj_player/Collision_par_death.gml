// Lerp position to other
x = lerp(x, other.x, 0.1);
y = lerp(y, other.y, 0.1);

// Set timer for 2 seconds
if (alarm[1] <= 0) {
    alarm[1] = room_speed * 2;
}