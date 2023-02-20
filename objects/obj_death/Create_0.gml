obj_dave.isDead = true;
screenshake(10, 3, 0.25, true, true, true, true);
if sprite_index == death_putin {
	image_xscale = 1;
	image_yscale = 1;
	audio_play_sound(choose(did_he_live_or_not, we_share_the_pain, goida), 10, false);
} else {
	audio_play_sound(snd_dave_death, 10, false);
}
alarm[0] = 104;