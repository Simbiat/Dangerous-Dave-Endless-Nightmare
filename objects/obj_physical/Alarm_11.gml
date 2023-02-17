/// @description Shader flashing off
isFlashing = false;
flash_counter++;
if flash_counter < flash_times {
	alarm[10] = flash_duration;
} else {
	flash_counter = 0;	
}