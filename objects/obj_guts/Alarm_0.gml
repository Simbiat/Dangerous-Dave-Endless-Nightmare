/// @description Auto destruction
if is_grounded {
	//Place a static sprite on Gore layer
	//Should be better for performance, compared to leaving objects
	var gore = layer_sprite_create("Gore", x, y, spr_gut_lump);
	layer_sprite_xscale(gore, image_xscale);
	layer_sprite_yscale(gore, image_yscale);
	if ds_queue_size(global.gore_list) >= 1000 {
		var oldGore = ds_queue_head(global.gore_list);
		layer_sprite_destroy(oldGore);
		ds_queue_dequeue(global.gore_list);
	}
	ds_queue_enqueue(global.gore_list, gore);
}
instance_destroy();