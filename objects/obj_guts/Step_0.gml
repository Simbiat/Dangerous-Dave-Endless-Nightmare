event_inherited();
if is_grounded {
	sprite_index = spr_gut_lump;
} else {
	if direction > 0 && direction < 90 {
		sprite_index = spr_gut_right_up;
	} else if direction > 90 && direction < 180 {
		sprite_index = spr_gut_left_up;
	} else if direction > 180 && direction < 270 {
		sprite_index = spr_gut_left_down;
	} else if direction > 270 && direction < 360 {
		sprite_index = spr_gut_right_down;
	} else if direction == 0 or direction == 360 {
		sprite_index = choose(spr_gut_right_up, spr_gut_right_down);
	} else if direction == 90 {
		sprite_index = choose(spr_gut_right_up, spr_gut_left_up);
	} else if direction == 180 {
		sprite_index = choose(spr_gut_left_up, spr_gut_left_down);
	} else if direction == 270 {
		sprite_index = choose(spr_gut_left_down, spr_gut_right_down);
	}
}
if speed == 0 || sprite_index == spr_gut_lump {
	sprite_index = spr_gut_lump;
	if alarm[0] < 0 {
		alarm[0] = 2*room_speed;
	}
}