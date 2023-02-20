if !obj_dave.isDead && !obj_dave.invincible {
	if hspeed < 0 {
		obj_dave.death(death_fire, "left");
	} else {
		obj_dave.death(death_fire, "right");
	}
	if generator_instance != noone && instance_exists(generator_instance) {
		generator_instance.projectiles_list = dequeu(generator_instance.projectiles_list, id);
	}
	instance_destroy();
}