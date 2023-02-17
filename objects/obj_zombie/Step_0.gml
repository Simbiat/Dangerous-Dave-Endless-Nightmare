event_inherited();

if isAttacking == false {
	faceDirection(zombie_left_walk, zombie_right_walk);
}

//Start attack
if isAttacking == false && inattack_range && alarm[1] < 0 {
	alarm[1] = attack_speed * room_speed;
	isAttacking = true;
	faceDirection(zombie_left_attack, zombie_right_attack);
}