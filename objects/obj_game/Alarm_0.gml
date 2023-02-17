///@description Delay initial spawn
//Generate ammo
instance_create_layer(10, room_height - 90, "UI", obj_ammo);
//Generate UI for lives
obj_game.daves = 0;
repeat (3) {
    obj_game.addLife(false);
}
spawn(obj_dave);
spawn(obj_zombie);