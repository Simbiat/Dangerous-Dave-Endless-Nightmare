if isFlashing {
	show_debug_message("here");
}
if isFlashing && flash_shader != noone {
	shader_set(flash_shader);
	draw_self();
	shader_reset();
	if alarm[11] < 0 {
		alarm[11] = flash_duration;
	}
} else {
	draw_self();
}