function flashOnBullet()
{
	shader_set(sha_bulletHit);
	//shader_set_uniform_f_array(shader_get_uniform(sha_flash, "u_colour"), [1.0, 1.0, 1.0, 0.25]);
	draw_self();
	shader_reset();
}

function blinkShader(shader, times, duration)
{
	flash_shader = shader;
	flash_times = times;
	flash_counter = 0;
	flash_duration = duration;
	if alarm[10] < 0 {
		alarm[10] = 1;
	}
}