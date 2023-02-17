/// @description Actual reload
if obj_game.ammo < obj_game.max_ammo {
	audio_play_sound(snd_reload, 1, false);
	obj_game.ammo += 1;
} else {
	faceDirection(dave_left_stand, dave_right_stand);
	isReloading = false;
}