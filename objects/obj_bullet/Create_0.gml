//Code for destruction
function explode()
{
	//Create bang
	instance_create_layer(x, y, "Instances", obj_bang, {image_angle: irandom(360)});
	//Destroy bullet
	instance_destroy();
}