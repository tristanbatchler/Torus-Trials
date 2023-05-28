ps = part_system_create();
pt = part_type_create();

// set default emitter
pe = part_emitter_create(ps);
part_emitter_region(ps, pe, x - 16, x + 16, y - 16, y + 16, ps_shape_rectangle, ps_distr_gaussian);

// setup a default particle
part_type_blend(pt, 1);
part_type_shape(pt, pt_shape_pixel);
part_type_size(pt, 2, 3, 0, 0);
part_type_scale(pt, 1, 1);
part_type_color_mix(pt, make_color_rgb(42.89, 204.63, 254.39), make_color_rgb(252.50, 252.50, 252.50));
part_type_alpha3(pt, 0.27, 0.94, 0.93);
part_type_life(pt, 52, 89);
part_type_orientation(pt, 0, 0, 0, 0, false);
part_type_speed(pt, 2, 4, 0.19, 0);
part_type_direction(pt, 89, 91, 0, 0);
part_type_gravity(pt, 0, 0);


part_emitter_stream(ps, pe, pt, 3); // where 3 is the number of particlespart_emitter_stream(ps, pe, pt, 3); // where 3 is the number of particles