//Add invisible floor to allow "stepping" on the platform
instance_create_layer(x, y-14, "Obstacles", obj_invis_floor, {image_xscale: 3, image_yscale: 0.7, jump_down: true});