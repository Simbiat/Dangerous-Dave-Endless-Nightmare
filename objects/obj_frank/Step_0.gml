event_inherited();
if hspeed < 0 {
	facing = "left";
} else if hspeed > 0 {
	facing = "right";
}
faceDirection(spr_frank_left, spr_frank_right);
if alarm[2] < 0 {
	alarm[2] = room_speed;	
}