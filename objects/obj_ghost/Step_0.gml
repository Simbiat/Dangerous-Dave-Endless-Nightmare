event_inherited();
move_towards_point(instance_exists(obj_dave) ?? 0, y, stride);
if hspeed < 0 {
	facing = "left";
} else if hspeed > 0 {
	facing = "right";
}

if isAttacking == false {
	faceDirection(spr_ghost_left, spr_ghost_right);
}