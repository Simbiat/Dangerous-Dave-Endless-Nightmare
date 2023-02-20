event_inherited();
if !is_grounded {
	faceDirection(dave_left_jump, dave_right_jump);
}
if isDead {
	hspeed = 0;
	faceDirection(dave_left_jump, dave_right_jump);
} else {
	if isActing() {
		cancelReloading();
		processActions();
		//Variable jump
		if obj_dave.vspeed < 0 && !holdingJump() {
			obj_dave.vspeed = max(obj_dave.vspeed, -obj_dave.jump_height/3);
		}
	} else {
		hspeed = 0;
		if isReloading {
			sprite_index = spr_reloading;
			if alarm[2] < 0 {
				alarm[2] = 0.6*room_speed;
			}
		} else {
			attemptReloading();
		}
	}
}