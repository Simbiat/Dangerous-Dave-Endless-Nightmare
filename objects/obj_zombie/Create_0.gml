event_inherited();
//Chance for Putin
if random_range(0,100) < 0.1 {
	putin = true;
}
//Change sprite scaling and attack range
if putin {
	image_xscale = 0.4;
	image_yscale = 0.4;
	attack_range_max = 50;
	hp = 3;
	points = 1600;
	guts = 20;
	dropChance = 0;
	//Need to ground again, due to change of sprite
	ground();
	audio_play_sound(choose(let_them_try, they_are_envious, goida), 1, false);
}
