/// @description Create lightning
if ds_exists(projectiles_list, ds_type_queue) {
var xpos = random_range(bbox_left, bbox_right);
var ypos;
//If X is on the edge of the box - we can freely select Y
//If not - we can only use the box's top, to make lightning appear only at the edges of the box
if xpos == bbox_left or xpos == bbox_right {
	ypos = random_range(bbox_bottom, bbox_top);
} else {
	ypos = bbox_top;
}
var projectile = instance_create_layer(xpos, ypos, "Projectiles", obj_lightning, {generator_instance: id});
if ds_queue_size(projectiles_list) >= lightnings_max {
	var oldProjectile = ds_queue_head(projectiles_list);
	instance_destroy(oldProjectile);
	ds_queue_dequeue(projectiles_list);
}
ds_queue_enqueue(projectiles_list, projectile);
}