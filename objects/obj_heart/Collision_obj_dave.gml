if obj_game.daves < obj_game.max_daves {
	instance_create_layer(x, obj_dave.bbox_top, "UI", obj_1up);
} else {
	instance_create_layer(x, obj_dave.bbox_top, "UI", obj_points, {value: points});
}
instance_destroy();