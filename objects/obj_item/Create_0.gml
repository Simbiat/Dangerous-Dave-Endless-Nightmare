event_inherited();
if object_index == obj_heart {
	//Let heart stay for longer
	alarm[0] = 25 * room_speed;
} else {
	alarm[0] = 5 * room_speed;
}