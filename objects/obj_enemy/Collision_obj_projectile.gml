if other.generator_instance != id {
	var objectId = variable_instance_get(other.generator_instance, object_index);
	if objectId != object_index {
		reduceHP();
	}
}