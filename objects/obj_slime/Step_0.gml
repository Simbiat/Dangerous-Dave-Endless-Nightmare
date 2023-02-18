event_inherited();
if isAttacking == false {
	move_towards_point(instance_exists(obj_dave) ?? 0, y, stride);
} else {
	hspeed = 0;	
}
if hspeed < 0 {
	facing = "left";
} else if hspeed > 0 {
	facing = "right";
}

if isAttacking == false {
	faceDirection(slime_left_move_down, slime_right_move_down);
}

//Start attack
if isAttacking == false and (place_meeting(bbox_left - attack_range, y, obj_dave) or place_meeting(bbox_right + attack_range, y, obj_dave)) {// and (bbox_left - attack_range >= obj_dave.x or obj_dave.x - x <= attack_range) {
	isAttacking = true;
	faceDirection(zombie_left_attack, zombie_right_attack);
	alarm[1] = room_speed;
}