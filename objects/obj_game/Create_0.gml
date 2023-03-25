//Function needed to prevent points overflow
function addPoints(value) {
	if points < 9223372036854775800 {
		points += value;
	} else {
		points = value;
	}
}

function addLife(sound = true)
{
	//Prevent exceeding the maximum of lives
	if daves < max_daves {
		//Add life icon instance
		if instance_exists(obj_life) {
			instance_create_layer(room_width - 36 - obj_life.sprite_width/1.5 * daves, room_height - 50, "UI", obj_life);
		} else {
			instance_create_layer(room_width - 36, room_height - 50, "UI", obj_life);
		}
		//Add life
		daves += 1;
		if sound {
			audio_play_sound(snd_1up, 1, false);
		}
	} else {
		instance_create_layer(obj_dave.x, obj_dave.y - obj_dave.sprite_height/2, "UI", obj_points, {value: 1600});
	}
}

function removeLife()
{
	daves -= 1;
	deaths += 1;
	if instance_exists(obj_life) {
		var toDestory = instance_furthest(room_width - 36, 58, obj_life);
		instance_destroy(toDestory);
	}
	alarm[1] = 104;
}
