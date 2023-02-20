if isFlashing && flash_shader != noone {
	shader_set(flash_shader);
	if flash_shader == sha_tone {
		shader_set_uniform_f_array(shader_get_uniform(sha_tone, "u_lum"), flash_lum);
		shader_set_uniform_f_array(shader_get_uniform(sha_tone, "u_tone"), flash_tone);
	}
	draw_self();
	shader_reset();
	if alarm[11] < 0 {
		alarm[11] = flash_duration;
	}
} else {
	draw_self();
}