/// @description Functions that check for player's actions
//Essentially, used for the sake of checking what buttons are being pressed,
//since I want to allow using various buttons

//Function that checks if a player is doing something
function isActing()
{
	if isMoving() or isAiming() or tryingToJump() or isShooting() {
		return true;	
	} else {
		return false;	
	}
}

function isMoving()
{
	if tryingToJump() or isMovingLeft() or isMovingRight() {
		return true;
	} else {
		return false;
	}
}

function isAiming()
{
	if isLookingUp() or isLookingDown() {
		return true;
	} else {
		return false;
	}
}

//Set of functions to check aiming
function isLookingUp()
{
	if keyboard_check(vk_up) or keyboard_check(vk_numpad8) or
	keyboard_check(ord("W")) {
		return true;
	} else {
		return false;
	}
}

function isLookingDown()
{
	if keyboard_check(vk_down) or keyboard_check(vk_numpad2) or
	keyboard_check(ord("S")) {
		return true;
	} else {
		return false;
	}
}

//Set of functions to check movement in specific positions
function isMovingLeft()
{
	if keyboard_check(vk_left) or keyboard_check(vk_numpad4) or
	keyboard_check(ord("A")) {
		return true;
	} else {
		return false;
	}
}

function isMovingRight()
{
	if keyboard_check(vk_right) or keyboard_check(vk_numpad6) or
	keyboard_check(ord("D")) {
		return true;
	} else {
		return false;
	}
}

//Check if jumping
function tryingToJump()
{
	if !is_grounded {
		//Indicates that we are in the air
		return true;	
	}
	if keyboard_check_pressed(vk_space) or keyboard_check_pressed(vk_numpad0) or
	mouse_check_button_pressed(mb_right) {
		obj_dave.jump_buffer = obj_dave.jump_bufferMax;
		return true;
	} else {
		return false;
	}
}

function holdingJump()
{
	if keyboard_check(vk_space) or keyboard_check(vk_numpad0) or
	mouse_check_button(mb_right) {
		return true;
	} else {
		return false;
	}
}

//Check if shooting
function isShooting()
{
	if mouse_check_button_pressed(mb_left) or
	keyboard_check_pressed(vk_numpad7) or keyboard_check_pressed(vk_numpad9) or
	keyboard_check_pressed(vk_control) or keyboard_check_pressed(vk_rcontrol) {
		return true;
	} else {
		return false;
	}
}