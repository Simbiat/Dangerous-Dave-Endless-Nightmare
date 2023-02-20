if obj_dave.isDead == true {
	isAttacking = false;
} else {
	//Count attack only, if the werewolf is in the air (that is still jumping)
	if isAttacking == true && !is_grounded {
		obj_dave.death(death_werewolf, facing);	
	}
}