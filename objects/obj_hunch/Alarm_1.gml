/// @description Stop attack animation
if facing == "right" {
	instance_create_layer(bbox_right, y, "Instances", obj_knife, {hspeed: 10});
} else {
	instance_create_layer(bbox_left, y, "Instances", obj_knife, {hspeed: -10});
}
isAttacking = false;
alarm[2] = attack_delay * room_speed;