//Aiming functions
function aimUp()
{
	//Prevent moving when aiming
	obj_dave.hspeed = 0;
	if obj_dave.facing == "right" {
		obj_dave.sprite_index = aim_right_up;
	} else {
		obj_dave.sprite_index = aim_left_up;
	}
}

function aimDown()
{
	//Prevent moving when aiming
	obj_dave.hspeed = 0;
	if obj_dave.facing == "right" {
		obj_dave.sprite_index = aim_right_down;
	} else {
		obj_dave.sprite_index = aim_left_down;
	}
}

function daveShoot()
{
	//Checking for aiming, because you may be holding down movement button at the same time
	if ((isAiming() or (isMoving() == false and tryingToJump() == false))) {
		//Also check that we are not shooting already or waiting for bullet to be created
		//This is required to prevent rapid fire from being "too fast"
		if obj_dave.isShooting == false and obj_dave.alarm[0] < 0 {
			obj_dave.isShooting = true;
			var delay = 0.3;
			if isLookingUp() {
				if obj_dave.facing == "right" {
					obj_dave.sprite_index = shoot_right_up;
				} else {
					obj_dave.sprite_index = shoot_left_up;
				}
				delay = 0.2;
			} else if isLookingDown() {
				if obj_dave.facing == "right" {
					obj_dave.sprite_index = shoot_right_down;
				} else {
					obj_dave.sprite_index = shoot_left_down;
				}
				delay = 0.2;
			} else {
				if obj_dave.facing == "right" {
					obj_dave.sprite_index = shoot_right_straight;
				} else {
					obj_dave.sprite_index = shoot_left_straight;
				}
				delay = 0.3;
			}
			obj_dave.alarm[0] = delay * room_speed;
		}
	}
}

function shoot()
{
	if obj_game.ammo > 0 {
		var bulletX = 0;
		var bulletY = 0;
		var bulletDirection = 0;
		var bulletAngle = 0;
		var bulletYScale = 6;
		var bulletXScale = -6;
		//Calculate coordinates
		if isLookingUp() {
			if obj_dave.facing == "right" {
				bulletX = bbox_right - 20;
				bulletDirection = 50;
				bulletAngle = 230;
				bulletXScale = 6;
				bulletYScale = -6;
			} else {
				bulletX = bbox_left + 12;
				bulletDirection = 130;
				bulletAngle = 125;
				bulletYScale = 6;
			}
			bulletY = bbox_top;
		} else if isLookingDown() {
			if obj_dave.facing == "right" {
				bulletX = bbox_right;
				bulletDirection = 330;
				bulletAngle = 150;
				bulletXScale = 6;
				bulletYScale = -6;
			} else {
				bulletX = bbox_left - 25;
				bulletDirection = 200;
				bulletAngle = 200;
				bulletYScale = -6;
			}
			bulletY = y + sprite_height/7;
		} else {
			if obj_dave.facing == "right" {
				bulletX = bbox_right;
				bulletDirection = 0;
			} else {
				bulletX = bbox_left;
				bulletDirection = 180;
				bulletXScale = 6;
			}
			bulletY = y - sprite_height/5;
		}
		//Reduce ammo
		obj_game.ammo -= 1;
		//Make sound
		audio_play_sound(snd_shooting, 1, false);
		//Create smoke
		effect_create_above(ef_smokeup, bulletX, bulletY, 1, c_ltgray);
		//Create bullet
		instance_create_layer(bulletX, bulletY, "Instances", obj_bullet, {direction: bulletDirection, image_angle: bulletAngle, image_yscale: bulletYScale, image_xscale: bulletXScale});
		//Recoil
		if obj_dave.facing == "right" {
			screenshake(1, 2, 0.25, true, false, false, false);
			move_and_collide(-25,0,obj_invis_wall);
		} else {
			screenshake(1, 2, 0.25, false, true, false, false);
			move_and_collide(25,0,obj_invis_wall);
		}
	} else {
		audio_play_sound(snd_no_ammo, 1, false);
	}
	obj_dave.isShooting = false;	
}

function bulletPushBack()
{
	var bullet = other;
	var force = 25;
	var vertical = 0;
	var horizontal = 0;
	//Generate variables based on bullet direction
	if bullet.image_angle == 0 {
		horizontal = +force;
	} else if bullet.image_angle == 180 {
		horizontal = -force;
	} else if bullet.image_angle > 0 && bullet.image_angle < 90 {
		horizontal = +force;
		vertical = +force;
	} else if bullet.image_angle > 90 && bullet.image_angle < 180 {
		horizontal = -force;
		vertical = +force;
	} else if bullet.image_angle > 180 && bullet.image_angle < 90 {
		horizontal = -force;
		vertical = -force;
	} else if bullet.image_angle > 270 {
		horizontal = +force;
		vertical = -force;
	}
	move_and_collide(horizontal,vertical,obj_obstacle);
}