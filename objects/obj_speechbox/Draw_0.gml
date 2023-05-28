// Draw a speech bubble with the given text

var text_width = string_width(text);
var text_height = string_height(text);

var bubble_width = text_width + 16;
var bubble_height = text_height + 16;

// Draw the bubble
draw_set_alpha(0.8);
draw_set_color(c_white);
draw_roundrect_ext(x - bubble_width / 2, y - bubble_height / 2, x + bubble_width / 2, y + bubble_height / 2, 6, 6, false);

// Draw the triangle pointing down
draw_triangle(x - 4, y + bubble_height / 2, x + 4, y + bubble_height / 2, x, y + bubble_height / 2 + 8, false);

// Draw the text
draw_set_alpha(1);
draw_set_color(c_black);
draw_set_font(fnt_main);
draw_text(x - text_width / 2, y - text_height / 2, text);

// Draw the continue prompt
draw_sprite_ext(sprite_index, image_index, x + bubble_width / 2 - 14, y + bubble_height / 2 - 12, image_xscale, image_yscale, image_angle, image_blend, image_alpha);

// Follow the speaker
x = speaker.x;
y = speaker.bbox_top - 32;