//Prevent getting outside of walls
if closest_left_wall.object_index == other.object_index or closest_right_wall.object_index == other.object_index {
		x = xprevious;
}

//Prevent getting outside of surfaces
if closest_floor.object_index == other.object_index {
	//Should be covered by gravity, leaving as a palceholder for now, just in case
	//ground();
}
if closest_ceil.object_index == other.object_index {
	y = closest_ceil.bbox_bottom + (y - bbox_top);
	vspeed = 0;
	if object_index == obj_dave {
		screenshake(1, 2, 0.25, false, false, true, false);
		audio_play_sound(snd_ceiling, 1, false);
	}
}