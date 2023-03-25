//In an object's Create event add line (width and height arguments are optional and will be applied only if not in a browser):
//Viewport is also optional and will override the base of the scaler
//window_set_dimensions(width, height, viewport);
//In Step event of the same object add these lines:
//window_scale();

function window_set_dimensions(width = 0, height = 0, viewport = -1)
{
	viewport = int64(viewport);
	if viewport >= 0 and viewport <= 7 {
		global.base_width = view_wport[viewport];
		global.base_height = view_hport[viewport];
	} else {
		global.base_width = room_width;
		global.base_height = room_height;
	}
	global.aspect_ratio = (global.base_width / global.base_height);
	global.screen_scale = 1;
	global.width = global.base_width;
	global.height = global.base_height;
	//For browsers we use the maximum size of the browser
	if os_browser == browser_not_a_browser {
		window_resize(global.width, global.height, viewport);	
		if width != 0 && height != 0 {
			window_resize(width, height, viewport);	
			window_set_size(global.width, global.height);
		}
		window_center();
	} else {
		window_scale();
	}
}

function window_scale()
{
	if os_browser == browser_not_a_browser {
		var cur_width = window_get_width();
		var cur_height = window_get_height();
	} else {
		var cur_width = browser_width;
		var cur_height = browser_height;
	}
	if (cur_width != global.width || cur_height != global.height) {
		window_resize(cur_width, cur_height);
	}
}

function window_resize(width, height, viewport = -1)
{
	viewport = int64(viewport);
	if ((width / global.aspect_ratio) > height) {
		width = height * global.aspect_ratio;
	} else {
		height = width / global.aspect_ratio;
	}
	global.width = width;
	global.height = height;
	global.screen_scale = global.width/global.base_width;
	//Resize window only browser. Otherwise we get restricted to certain window sizes,
	//which may prevent window snapping, which expects a window to fill in a certain area
	if os_browser != browser_not_a_browser {
		window_set_size(width, height);
	}
	//Adjust viewport
	if viewport >= 0 and viewport <= 7 {
		view_wport[viewport] = width;
		view_hport[viewport] = height;
		camera_set_view_size(view_camera[viewport], width, height);
	}
	surface_resize(application_surface, width, height);
	// Set correct size for GUI layer
	display_set_gui_size(width, height);
	//Center in browser
	if os_browser != browser_not_a_browser {
		window_center();
	}
}