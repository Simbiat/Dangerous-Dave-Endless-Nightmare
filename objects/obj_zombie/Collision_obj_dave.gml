if !obj_dave.isDead && !obj_dave.invincible && isAttacking == true && inattack_range {
	if putin {
		obj_dave.death(death_putin, facing);
	} else {
		obj_dave.death(death_punch, facing);
	}
}