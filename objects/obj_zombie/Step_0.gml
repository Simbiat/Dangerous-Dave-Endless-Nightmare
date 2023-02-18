event_inherited();

if isAttacking == false {
	if putin {
		sprite_index = putin_walk;
	} else {
		faceDirection(zombie_left_walk, zombie_right_walk);
	}
}

//Start attack
if isAttacking == false && inattack_range && alarm[1] < 0 {
	alarm[1] = attack_speed * room_speed;
	isAttacking = true;
	if putin {
		sprite_index = putin_attack;
	} else {
		faceDirection(zombie_left_attack, zombie_right_attack);
	}
}