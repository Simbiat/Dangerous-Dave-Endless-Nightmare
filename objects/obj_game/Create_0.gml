// Set game width, height and scale
var width = 1920, height = 1080;
global.scale = min(1, display_get_height() / height, display_get_width() / width);

// Set window size and surface resolution
window_set_size(width*global.scale, height*global.scale);
surface_resize(application_surface, width*global.scale, height*global.scale);

// Move window to center of display
window_set_position(display_get_width()/2-(width*global.scale)/2, display_get_height()/2-(height*global.scale)/2);

// Set correct size for GUI layer
display_set_gui_size(width*global.scale, height*global.scale);

randomise();

//Generate font from sprite
if !variable_global_exists("score_font") {
    global.score_font = font_add_sprite_ext(spr_score_font, "0123456789", true, 2);
}

if !variable_global_exists("gore_list") {
    global.gore_list = ds_queue_create();
}

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
