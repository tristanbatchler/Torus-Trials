draw_self();
draw_set_color(c_white);
draw_set_font(fnt_main);

var player_dist = distance_to_object(obj_player);

switch room {
	case tut_2:
		// Show player the jump button when near ledge
		var radius = 96;
		if (player_dist < radius) {
			sprite_index = spr_key_button;
		}
		break;
		
	case tut_3:
		// Show the player to hold in the jump button when near the high ledge
		var radius = 96;
		if (player_dist < radius) {
			sprite_index = spr_key_button;
			draw_text_centered(x, y, "Hold...");
		}
		break;
		
	case tut_4:
		// Trigger wtf dialogue and "leap of faith" text
		var radius1 = 250;
		var radius2 = 150;
		if (player_dist < radius1) {
			if (!one_time_player_spoken_line) {
				draw_speech(obj_player, ["How the fuck am I meant to get up there?", "God damnit"]);
				one_time_player_spoken_line = true;
			}
		} 
		if (player_dist < radius2) {
			draw_text_centered(x, y, "Leap of faith");
		}
		break;
}