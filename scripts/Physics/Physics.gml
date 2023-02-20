function applyPhysics()
{
	closest_floor = closestFloor();
	closest_ceil = closestCeiling();
	closest_left_wall = closestLeftWall();
	closest_right_wall = closestRightWall();
	is_grounded = isGrounded();
	if object_get_parent(object_index) == obj_enemy {
		followPlayer();
		//Player seems to work fine with just collision event, but enemies get too far without this
		horizontalCollisions();
	}
	applyGravity();
	//move_bounce_all(false);
}

function closestFloor()
{
	var toReturn = noone;
	var floors = ds_list_create();
	var count = collision_rectangle_list(bbox_left, bbox_bottom, bbox_right, room_floor.bbox_top + max(1, sign(vspeed)), obj_invis_floor, true, true, floors, true);
	if count > 0 {
		//Need to order "manually", because rectangle_list orders based on distance from rectangle's center
		for (var i = 0; i < count; ++i) {
			//If this is the first iteration, assume it to be closest one
			if toReturn == noone {
				toReturn = floors[| i];
			} else {
				//Check if current iteration's border is "higher"
				if (floors[| i].bbox_top <= toReturn.bbox_top) {
					toReturn = floors[| i];
				}
			}
		}
	} else {
		//Most likely the object's lower boundary is below the room floor. Need to adjust position, since this is not normal
		y = y - (bbox_bottom - room_floor.bbox_top);
		toReturn = room_floor;
	}
	ds_list_destroy(floors);
	return toReturn;
}

function closestCeiling()
{
	var toReturn = noone;
	var ceilings = ds_list_create();
	var count = collision_rectangle_list(bbox_left, bbox_top, bbox_right, room_ceiling.bbox_bottom - max(1, sign(vspeed)), obj_invis_ceil, true, true, ceilings, true);
	if count > 0 {
	    toReturn = ceilings[| 0];
	} else {
		//Most likely the object's top boundary is above the room ceiling. Need to adjust position, since this is not normal
		y = y + (bbox_top - room_ceiling.bbox_bottom) + 1;
		toReturn = room_ceiling;
	}
	ds_list_destroy(ceilings);
	return toReturn;
}

function closestLeftWall()
{
	var toReturn = noone;
	var walls = ds_list_create();
	var count = collision_rectangle_list(bbox_left, bbox_top, room_left_wall.bbox_right - max(1, sign(hspeed)), bbox_bottom, obj_invis_wall, true, true, walls, true);
	if count > 0 {
	    toReturn = walls[| 0];
	} else {
		//Most likely the object's left boundary is behind the left wall. Need to adjust position, since this is not normal
		x = x + (bbox_left - room_left_wall.bbox_right) + 1;
		toReturn = room_left_wall;
	}
	ds_list_destroy(walls);
	return toReturn;
}

function closestRightWall()
{
	var toReturn = noone;
	var walls = ds_list_create();
	var count = collision_rectangle_list(bbox_right, bbox_top, room_right_wall.bbox_left + max(1, sign(hspeed)), bbox_bottom, obj_invis_wall, true, true, walls, true);
	if count > 0 {
	    toReturn = walls[| 0];
	} else {
		//Most likely the object's right boundary is behind the right wall. Need to adjust position, since this is not normal
		x = x - (room_right_wall.bbox_left - bbox_right) - 1;
		toReturn = room_left_wall;
	}
	ds_list_destroy(walls);
	return toReturn;
}

function ground()
{
	closest_floor = closestFloor();
	if bbox_bottom < closest_floor.bbox_top {
		y += (closest_floor.bbox_top - bbox_bottom);
	} else if  bbox_bottom < closest_floor.bbox_top {
		y -= (bbox_bottom - closest_floor.bbox_top);
	}	
	if vspeed > 0 {
		vspeed = 0;
	}
}

function isGrounded()
{
	//Should not happen, but if there is no floor, we are definitely not grounded
	if closest_floor == noone {
		return false;	
	}
	if bbox_bottom == closest_floor.bbox_top {
		return true;	
	} else {
		return false;	
	}
}

function applyGravity() {
	if !is_grounded {
		//Get distance
		var distance = closest_floor.bbox_top - bbox_bottom;
		if distance <= 0 {
			vspeed = 0;	
			//Thismay mean we are "below" the floor and need to adjust position
			y += distance;
			if (object_index == obj_dave) {
				if isJumping {
					daveLand();
				}
			}
		} else {
			if vspeed + gravityForce <= distance {
				vspeed += gravityForce;
			} else {
				vspeed = distance;
				if (object_index == obj_dave) {
					daveLand();
				}
			}
		}
	} else {
		vspeed = 0;
		if (object_index == obj_dave) {
			if isJumping {
				daveLand();
			}
		}
	}
}

//Function for when Dave lands on the ground
function daveLand()
{
	if (closest_floor == room_floor) {
		screenshake(0.5, 1, 0.25, false, false, false, true);
	}
	audio_play_sound(snd_landing, 1, false);
	isJumping = false;
}

function horizontalCollisions()
{
	//Get distance
	var distanceLeft = bbox_left - closest_left_wall.bbox_right;
	var distanceRight = closest_right_wall.bbox_left - bbox_right;
	if facing == "left" {
		if distanceLeft <= 0 {
			hspeed = 0;	
			x -= distanceLeft;
			facing = "right";
		} else {
			if stride <= distanceLeft {
				hspeed = -stride;
			} else {
				hspeed = -distanceLeft;
			}
		}
	} else {
		if distanceRight <= 0 {
			hspeed = 0;	
			x += distanceRight;
			facing = "left";
		} else {
			if stride <= distanceRight {
				hspeed = stride;
			} else {
				hspeed = distanceRight;
			}
		}
	}
}

function faceDirection(left, right)
{
	if object_index != obj_dave {
		if direction < 90 or direction > 270 {
			facing = "right";
		} else if direction > 90 and direction < 270 {
			facing = "left";
		}
	}
	if facing == "left" {
		sprite_index = left;
	} else if facing == "right" {
		sprite_index = right;
	}
}

function isInAttack_range() {
	//Clearly not in attack range, if there is no Dave
	if !instance_exists(obj_dave) {
		return false;	
	}
	//Dave is already dead, we are playing the death "sequence"
	if obj_dave.isDead or obj_dave.invincible {
		return false;
	}
	//If enemy is over dave, and minimum attack range is 0, consider in range
	if attack_range_min == 0 && collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_dave, true, true) {
		return true;
	}
	if (facing == "left" && collision_rectangle(x - attack_range_min, bbox_top, x - attack_range_max, bbox_bottom, obj_dave, true, true)) or
		(facing == "right" && collision_rectangle(x + attack_range_min, bbox_top, x + attack_range_max, bbox_bottom, obj_dave, true, true))
	{
		return true;
	} else {
		return false;
	}
}

function screenshake(time, magnitude, fade = 0.25, left = true, right = true, top = true, bottom = true) {
	obj_screenshake.shaking = true;
	obj_screenshake.time = time;
	obj_screenshake.magnitude = magnitude;
	obj_screenshake.fade = fade;
	obj_screenshake.left = left;
	obj_screenshake.right = right;
	obj_screenshake.top = top;
	obj_screenshake.bottom = bottom;
}