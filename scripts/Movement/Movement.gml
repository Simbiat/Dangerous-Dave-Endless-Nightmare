//Movement functions
function daveMoveLeft(jump = false)
{
	obj_dave.facing = "left";
	if jump {
		obj_dave.hspeed = -obj_dave.jump_width;
	} else {
		obj_dave.sprite_index = dave_left_run;
		obj_dave.hspeed = -obj_dave.stride;
		//move_and_collide(-obj_dave.stride, 0, obj_invis_wall);
	}
}

function daveMoveRight(jump = false)
{
	obj_dave.facing = "right";
	if jump {
		obj_dave.hspeed = obj_dave.jump_width;
	} else {
		obj_dave.sprite_index = dave_right_run;
		obj_dave.hspeed = obj_dave.stride;
		//move_and_collide(obj_dave.stride, 0, obj_invis_wall);
	}
}

function daveJump()
{
	if jump_buffer > 0 {
		jump_buffer -= 1;
		if is_grounded {
			audio_play_sound(snd_jump, 1, false);
			isJumping = true;
			if isLookingDown() && closest_floor.jump_down {
				//Jump down. Need to  obj_dave.jump_height*5 to make it look a bit better.
				//Without it animation starts at a higher y, and looks as if Dave is floating above the floor
				//Probably because of scaling of floor objects on platforms
				obj_dave.y += (closest_floor.bbox_bottom - closest_floor.bbox_top) + obj_dave.jump_height*5;
			} else {
				obj_dave.vspeed = -obj_dave.jump_height;
			}
			jump_buffer = 0;
		}
	}
}

function followPlayer()
{
	if isAttacking == false {
		if instance_exists(obj_dave) && closest_floor == obj_dave.closest_floor && !obj_dave.isDead && !obj_dave.invincible {
			//Determine where Dave is relative to the enemy
			var distanceLeft = bbox_left - obj_dave.bbox_right;
			var distanceRight = obj_dave.bbox_left - bbox_right;
			if distanceRight - attack_range_min >= 0 {
				//Dave is on the right
				if facing == "left" {
					facing = "right";
				}
				move_towards_point(obj_dave.bbox_left - attack_range_min, y, stride);
			} else if distanceLeft - attack_range_min >= 0 {
				//Dave is on the left
				if facing == "right" {
					facing = "left";
				}
				move_towards_point(obj_dave.bbox_right + attack_range_min, y, stride);
			}
			move_towards_point(obj_dave.x, y, stride);
		} else {
			if facing == "left" {
				move_towards_point(closest_left_wall.bbox_right, y, stride);
			} else {
				move_towards_point(closest_right_wall.bbox_left, y, stride);
			}
		}
	} else {
		if !attack_while_moving {
			hspeed = 0;	
		}
	}
}