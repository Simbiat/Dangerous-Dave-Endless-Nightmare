if os_browser == browser_not_a_browser {
	if window_get_fullscreen() {
		window_set_fullscreen(false);
	} else {
		window_set_fullscreen(true);
	}
}