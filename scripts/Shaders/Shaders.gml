function flashOnBullet()
{
	
	if object_index == obj_zombie && putin {
		 flagUkraine();
	} else {
		shader_set(sha_tone);
		shader_set_uniform_f_array(shader_get_uniform(sha_tone, "u_lum"), [1.0, 1.0, 1.0, 1.0]);
		shader_set_uniform_f_array(shader_get_uniform(sha_tone, "u_tone"), [1.0, 1.0, 1.0, 1.0]);
		draw_self();
		shader_reset();
	}
}

function flagRussian()
{
	var _uniUV = shader_get_uniform(sha_russia, "u_uv");
	shader_set(sha_russia);
	var uv = sprite_get_uvs(sprite_index, image_index);
	shader_set_uniform_f(_uniUV, uv[1], uv[3]);
	draw_self();
	shader_reset();
}

function flagUkraine()
{
	var _uniUV = shader_get_uniform(sha_russia, "u_uv");
	shader_set(sha_ukraine);
	var uv = sprite_get_uvs(sprite_index, image_index);
	shader_set_uniform_f(_uniUV, uv[1], uv[3]);
	draw_self();
	shader_reset();
}

function blinkShader(shader, times, duration, tone = [], lum = [])
{
	flash_shader = shader;
	if array_length(tone) > 0 {
		flash_tone = tone;
	} else {
		flash_tone = [1.0, 1.0, 1.0, 1.0];
	}
	if array_length(lum) > 0 {
		flash_lum = lum;
	} else {
		flash_lum = [1.0, 1.0, 1.0, 1.0];
	}
	flash_times = times;
	flash_counter = 0;
	flash_duration = duration;
	if alarm[10] < 0 {
		alarm[10] = 1;
	}
}