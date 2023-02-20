/// @description Change direction
if instance_exists(obj_dave) {
	direction = point_direction(x, y, obj_dave.x, obj_dave.y);
	direction += random_range(-90, 90);
} else {
	direction = random_range(0, 360);
}
x += lengthdir_x(speed, direction);
y += lengthdir_y(speed, direction);