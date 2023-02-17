//Create map for sprites
points_sprites = ds_map_create();
ds_map_add(points_sprites, 100, spr_100);
ds_map_add(points_sprites, 200, spr_200);
ds_map_add(points_sprites, 400, spr_400);
ds_map_add(points_sprites, 800, spr_800);
ds_map_add(points_sprites, 1600, spr_1600);
//Create map of sounds
points_sounds = ds_map_create();
ds_map_add(points_sounds, 100, snd_diamond);
ds_map_add(points_sounds, 200, snd_bag);
ds_map_add(points_sounds, 400, snd_globe);
ds_map_add(points_sounds, 800, snd_candle);
ds_map_add(points_sounds, 1600, snd_1up);
//Set sprite
var scoreSprite = ds_map_find_value(points_sprites, value);
if scoreSprite != undefined {
	sprite_index = scoreSprite;
}
//Play sound
if (sound) {
	var scoreSound = ds_map_find_value(points_sounds, value);
	if scoreSound != undefined {
		audio_play_sound(scoreSound, 1, false);
	}
}
//Add points
obj_game.addPoints(value);
alarm[0] = 0.75*room_speed;
//Give 1up if number of points if score can be divided by 100k
if (obj_game.points % 100000 == 0 && obj_game.daves < obj_game.max_daves) {
	instance_create_layer(obj_dave.x, obj_dave.y - obj_dave.sprite_height/2, "UI", obj_1up);
}
