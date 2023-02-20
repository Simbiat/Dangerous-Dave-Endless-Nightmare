event_inherited();
//Set ammo
obj_game.ammo = obj_game.max_ammo;
if obj_game.deaths > 0 {
	//Set invincibility to prevent excessive deaths
	invincible = true;
	//Gold tone and black&white luminence (close to sepia effect)
	blinkShader(sha_tone, 7, 0.25*room_speed, [1.0, 0.843, 0.0], [0.299, 0.587, 0.114]);
	alarm[3] = 3*room_speed;
}

function attemptReloading()
{
	if !obj_dave.isShooting {
		if obj_game.ammo < obj_game.max_ammo {
			if alarm[1] < 0 {
				alarm[1] = 0.5*room_speed;
			}
		}
		if alarm[2] < 0 {
			faceDirection(dave_left_stand, dave_right_stand);
		}
	}
}

function cancelReloading()
{
	alarm[1] = -1;
	alarm[2] = -1;
	isReloading = false;
}

function death(death_sprite, from = "left")
{
	if !invincible {
		obj_game.removeLife();
		repeat(4) {
			instance_create_layer(obj_dave.x, obj_dave.y, "Instances", obj_guts, {direction: random_range(181, 359)});
		}
		if from == "left" {
			instance_create_layer(room_width/2,room_height/2, "UI", obj_death, {sprite_index: death_sprite});
		} else {
			instance_create_layer(room_width/2,room_height/2, "UI", obj_death, {sprite_index: death_sprite, image_xscale: -5});
		}
	}
}