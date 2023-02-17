/// @description Wait before reload
if !obj_dave.isShooting {
	if obj_game.ammo < obj_game.max_ammo {
		if !isReloading {
			isReloading = true;
			sprite_index = spr_reloading;
			alarm[2] = 0.5*room_speed;
		}
	}
}