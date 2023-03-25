draw_set_colour(c_white);
draw_set_halign(fa_center);
draw_set_font(global.score_font);
draw_text_transformed(room_width/2*global.screen_scale, (room_height - 90)*global.screen_scale, obj_game.points, 10*global.screen_scale, 10*global.screen_scale, 0);