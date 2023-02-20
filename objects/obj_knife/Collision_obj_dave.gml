if !obj_dave.isDead && !obj_dave.invincible {
	if hspeed < 0 {
		obj_dave.death(death_knife, "left");
	} else {
		obj_dave.death(death_knife, "right");
	}
	instance_destroy();
}