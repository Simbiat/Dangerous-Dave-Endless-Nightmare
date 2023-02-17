var weightLife = obj_game.max_daves - obj_game.daves;
var heartChance = irandom_range(1,100);
var points_object = instance_create_layer(x, obj_dave.bbox_top, "UI", obj_points, {value: points});
if obj_game.daves < obj_game.max_daves && heartChance <= 10 * weightLife {
	instance_create_layer(x, points_object.bbox_top - points_object.sprite_height*2, "UI", obj_1up);
}
instance_destroy();