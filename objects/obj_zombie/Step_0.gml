event_inherited();

if isAttacking == false {
	if putin {
		sprite_index = putin_walk;
	} else {
		faceDirection(zombie_left_walk, zombie_right_walk);
	}
} else {
	hspeed = 0;	
}

//Start attack
if isAttacking == false && !obj_dave.isDead && inattack_range && alarm[1] < 0 {
	alarm[1] = attack_speed * room_speed;
	isAttacking = true;
	if putin {
		sprite_index = putin_attack;
	} else {
		faceDirection(zombie_left_attack, zombie_right_attack);
	}
}