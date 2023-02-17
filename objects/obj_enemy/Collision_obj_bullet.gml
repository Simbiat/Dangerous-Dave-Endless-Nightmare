hp -= 1;
if (hp == 0) {
	instance_create_layer(x, y - sprite_height/2, "UI", obj_points, {value: points, sound: false});
	//Generate guts
	if guts > 0 {
		repeat(guts) {
			instance_create_layer(other.x, other.y, "Instances", obj_guts, {direction: random_range(other.direction - 90, other.direction + 90)});
		}
	}
	//Item drop
	itemDrop();
	
	
	
	
	//Temporary code for testing
	switch (object_index) {
	    case obj_zombie:
	        spawn(obj_hunch);
	        break;
		case obj_hunch:
	        spawn(obj_werewolf);
	        break;
		case obj_werewolf:
	        spawn(obj_frank);
	        break;
	    default:
	        //Do nothing
	        break;
	}
	
	
	
	
	
	//Destroy the instance
	instance_destroy();
} else {
	blink_on_hit = true;
	alarm[0] = 0.25*room_speed;
	//Push back
	bulletPushBack();
}