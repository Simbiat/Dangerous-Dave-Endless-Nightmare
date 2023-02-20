event_inherited();
if ukraine {
	flagUkraine();
}
if isDead && instance_exists(obj_death) {
	if obj_death.sprite_index == death_putin {
		flagRussian();
	} else {
		var shaderTone = [];
		var lum = [1.0, 1.0, 1.0, 1.0];
		switch (obj_death.sprite_index) {
		    case death_fire:
				//Fire color
		        shaderTone = [0.886, 0.3451, 0.13];
		        break;
		    case death_ghost:
				//Ghost white
		        shaderTone = [0.9726, 0.9726, 1.0];
		        break;
		    case death_knife:
				//Steel color
		        shaderTone = [0.2627, 0.2745, 0.2941];
		        break;
		    case death_punch:
				//Black eye
		        shaderTone = [0.2902, 0.3765, 0.4941];
		        break;
		    case death_slime:
				//Slime's green
		        shaderTone = [0.33, 1.0, 0.33];
		        break;
		    case death_spider:
				//Spiderweb color
				lum = [0.25, 0.25, 0.25];
		        shaderTone = [0.8431, 0.851, 0.8196];
		        break;
		    case death_werewolf:
				//Werewolf's brown
				lum = [0.5, 0.5, 0.5];
		        shaderTone = [0.6667, 0.33, 0.0];
		        break;
		    default:
				//Blood color
		        shaderTone = [0.53, 0.03137, 0.03137];
		        break;
		}
		shader_set(sha_tone);
		shader_set_uniform_f_array(shader_get_uniform(sha_tone, "u_lum"), lum);
		shader_set_uniform_f_array(shader_get_uniform(sha_tone, "u_tone"), shaderTone);
		draw_self();
		shader_reset();
	}
}

