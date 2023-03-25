window_set_dimensions();

randomise();

//Generate font from sprite
if !variable_global_exists("score_font") {
    global.score_font = font_add_sprite_ext(spr_score_font, "0123456789", true, 2);
}

if !variable_global_exists("gore_list") {
    global.gore_list = ds_queue_create();
}