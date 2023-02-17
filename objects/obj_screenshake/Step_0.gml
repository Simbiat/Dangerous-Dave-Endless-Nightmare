if (shaking) 
{ 
	time -= 0.1; 
	if right && left {
		dx = random_range(-magnitude, magnitude);
	} else if right && !left {
		dx = random_range(0, magnitude);
	} else if !right && left {
		dx = random_range(-magnitude, 0);
	} else {
		dx = 0;
	}
	if top && bottom {
		dy = random_range(-magnitude, magnitude);
	} else if top && !bottom {
		dy = random_range(-magnitude, 0);
	} else if !top && bottom {
		dy = random_range(0, magnitude);
	} else {
		dy = 0;
	}
	camera_set_view_pos(view_camera[0], dx, dy); 
	if (time <= 0) { 
		magnitude -= fade;
		if (magnitude <= 0) { 
			camera_set_view_pos(view_camera[0], 0, 0); 
			shaking = false; 
		} 
	} 
}