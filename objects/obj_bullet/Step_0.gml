//Apply gravity with every frame for parabelic movement
y -= gravity;
//If for some reason the bullet has stopped, but the bullet is still there - force destroy it.
if (speed == 0) {
	instance_destroy();
}
