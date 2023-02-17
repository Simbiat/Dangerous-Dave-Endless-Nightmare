//Apply gravity with every frame for parabelic movement
y -= gravity;
//If for some reason the bullet has stopped, delayed destruction has expired,
//but the bullet is still there - force destroy it.
if (speed == 0 and alarm[0] < 0) {
	instance_destroy();
}
