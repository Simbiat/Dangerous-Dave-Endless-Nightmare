if alarm[0] < 0 {
	alarm[0] = turnDelay;
}
if generator_instance != noone && !instance_exists(generator_instance) {
	//Enemy, that created projectile was destroyed
	if alarm[1] < 0 {
		alarm[1] = afterlife;	
	}
}