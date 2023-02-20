//Bullet should go through floors, that can be jumped down off
if other.object_index != obj_invis_floor || other.jump_down == false {
	explode();
}