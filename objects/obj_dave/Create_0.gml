event_inherited();
//Set ammo
obj_game.ammo = obj_game.max_ammo;
//Set invincibility to prevent excessive deaths
invincible = true;
alarm[3] = 5*room_speed;

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
		if from == "left" {
			instance_create_layer(room_width/2,room_height/2, "UI", obj_death, {sprite_index: death_sprite});
		} else {
			instance_create_layer(room_width/2,room_height/2, "UI", obj_death, {sprite_index: death_sprite, image_xscale: -5});
		}
	}
}