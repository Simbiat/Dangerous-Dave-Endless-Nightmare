function spawn(object_index)
{
	switch (object_index) {
		//This is for demo only
		case putin_walk:
			instance_create_layer(1805, 812, "Instances", obj_zombie, {putin: true});
			break;
	    case obj_dave:
	        instance_create_layer(107, 839, "Instances", object_index);
	        break;
		case obj_frank:
	        instance_create_layer(1729, 673, "Instances", object_index);
	        break;
		case obj_ghost:
	        instance_create_layer(1829, 839, "Instances", object_index);
	        break;
		case obj_hunch:
	        instance_create_layer(1833, 867, "Instances", object_index);
	        break;
		case obj_silas:
	        instance_create_layer(1665, 673, "Instances", object_index);
	        break;
		case obj_skull:
	        instance_create_layer(1832, 856, "Instances", object_index);
	        break;
		case obj_slime:
	        instance_create_layer(1836, 924, "Instances", object_index);
	        break;
		case obj_spider:
	        instance_create_layer(1676, 28, "Instances", object_index);
	        break;
		case obj_werewolf:
	        instance_create_layer(1804, 840, "Instances", object_index);
	        break;
		case obj_zombie:
	        instance_create_layer(1805, 812, "Instances", object_index);
	        break;
	    default:
	        // code here
	        break;
	}
}