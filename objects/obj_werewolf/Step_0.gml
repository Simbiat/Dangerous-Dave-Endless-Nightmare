event_inherited();

if isAttacking == false {
	gravityForce = 0.3;
	faceDirection(ww_left_move, ww_right_move);
} else {
	gravityForce = 0;	
}

//Start attack
if isAttacking == false and (place_meeting(bbox_left - attack_range, y, obj_dave) or place_meeting(bbox_right + attack_range, y, obj_dave)) {
	isAttacking = true;
	faceDirection(ww_left_attack, ww_right_attack);
	alarm[1] = room_speed;
}