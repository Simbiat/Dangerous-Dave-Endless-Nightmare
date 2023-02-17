/// @description Functions related to player control
//Function to process button presses
function processActions()
{
	if tryingToJump() {
		daveJump();
		//Process movement
		if isMovingLeft() {
			daveMoveLeft(true);
		} else if isMovingRight() {
			daveMoveRight(true);
		}
		return;
	}
	if isShooting() {
		daveShoot();
		return;
	}
	if isLookingUp() {
		aimUp();
		return;
	}
	if isLookingDown() {
		aimDown();
		return;
	}
	if isMovingLeft() {
		daveMoveLeft();
		return;
	}
	if isMovingRight() {
		daveMoveRight();
		return;
	}
}