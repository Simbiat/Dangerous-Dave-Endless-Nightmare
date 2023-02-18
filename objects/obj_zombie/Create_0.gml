event_inherited();
//Chance for Putin
if random_range(0,100) < 0.1 {
	putin = true;
}
//Change sprite scaling and attack range
if putin {
	image_xscale = 0.4;
	image_yscale = 0.4;
	attack_range = 100;
	hp = 3;
	points = 1600;
	guts = 20;
}
