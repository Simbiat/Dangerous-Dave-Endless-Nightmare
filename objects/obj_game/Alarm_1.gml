///@description Delay respawn
if obj_game.daves > -1 {
	audio_play_sound(snd_start_level, 1, false);
	spawn(obj_dave);
} else {
	game_restart();	
}