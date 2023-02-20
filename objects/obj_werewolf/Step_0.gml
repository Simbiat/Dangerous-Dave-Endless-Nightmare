if isAttacking == false and alarm[3] < 0 {
	stride = 3;
	gravityForce = 0.3;
	faceDirection(ww_left_move, ww_right_move);
	ground();
} else {
	faceDirection(ww_left_attack, ww_right_attack);
}
//Start attack
if isAttacking == false and canAttack and inattack_range and alarm[3] < 0 {
	//Attempt to make attack dangerous only after the jump itself
	//Otherwise, it gets triggered, when werewolf is not in the air yet
	alarm[3] = 0.25 * room_speed;
	canAttack = false;
	y -= 100;
	vspeed = -100
	stride = 12;
	alarm[1] = attack_speed * room_speed;
}
event_inherited();