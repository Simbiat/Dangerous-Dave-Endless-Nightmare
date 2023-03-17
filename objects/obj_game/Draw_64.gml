draw_set_colour(c_white);
draw_set_halign(fa_center);
draw_set_font(global.score_font);
draw_text_transformed(room_width/2*global.scale, (room_height - 90)*global.scale, obj_game.points, 10, 10, 0);