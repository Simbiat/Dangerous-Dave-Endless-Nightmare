event_inherited();

if isAttacking == false {
	faceDirection(hunch_left_move, hunch_right_move);
} else {
	hspeed = 0;
}

//Start attack
if isAttacking == false and canAttack and inattack_range {
	isAttacking = true;
	canAttack = false;
	faceDirection(hunch_left_attack, hunch_right_attack);
	alarm[1] = attack_speed * room_speed;
}