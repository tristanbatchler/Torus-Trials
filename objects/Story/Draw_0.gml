draw_set_color(c_white);
draw_set_font(fnt_main);

var player_dist = distance_to_object(obj_player);

switch room {
	case tut_2:
		// Show player the jump button when near ledge
		if (player_dist < 96) {
			sprite_index = spr_key_button;
		}
		break;
		
	case tut_4:
		// Trigger wtf dialogue and "leap of faith" text
		if (player_dist < 250) {
			if (!one_time_player_spoken_line) {
				draw_speech(obj_player, ["How the fuck am I meant to get up there?", "God damnit"]);
				one_time_player_spoken_line = true;
			}
		} 
		if (player_dist < 150) {
			draw_text(x, y, "Leap of faith");	
		}
}