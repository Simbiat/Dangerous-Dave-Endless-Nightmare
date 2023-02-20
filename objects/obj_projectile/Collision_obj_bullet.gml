if generator_instance != noone && instance_exists(generator_instance) {
	generator_instance.projectiles_list = dequeu(generator_instance.projectiles_list, id);
}
instance_destroy();