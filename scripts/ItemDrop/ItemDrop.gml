function itemDrop()
{
	var chance = irandom_range(1, 100);
	//Drop an item with limited chance
	if chance <= dropChance {
		var item = randomItem();
		instance_create_layer(x, y, "UI", item);
	}
}

function randomItem()
{
	//Create list of items
	var items = itemList();
	//Get weight of life (to increase chances for hearts)
	var weightLife = obj_game.max_daves - obj_game.daves;
	//Create table of weighted values (weghit, item)
	var weights = [diamondChance - weightLife*2, bagChance - weightLife*2, globeChance - weightLife*2, candleChance - weightLife*2, chestChance - weightLife*2, heartChance * weightLife];
	//Get cumulative weight
	var cumulative_weight = 0;
	for (var item = 0; item <= 5; ++item) {
		cumulative_weight += weights[item];
	}
	//Roll the dice
    var roll = irandom_range(1, cumulative_weight);
	//Check the value of the roll to determine the item
	cumulative_weight = 0;
	var item_object = obj_diamond;
	for (var item = 0; item <= 5; ++item) {
		cumulative_weight += weights[item];
		if roll < cumulative_weight {
			//Get the item
            item_object = ds_map_find_value(items, item);
			//Return the object index
			if item_object != undefined {
				return item_object;
			}
		}
	}
	return obj_diamond;
}

function itemList()
{
	var items = ds_map_create();
	ds_map_add(items, 0, obj_diamond);
	ds_map_add(items, 1, obj_bag);
	ds_map_add(items, 2, obj_globe);
	ds_map_add(items, 3, obj_candle);
	ds_map_add(items, 4, obj_chest);
	ds_map_add(items, 5, obj_heart);
	return items;
}