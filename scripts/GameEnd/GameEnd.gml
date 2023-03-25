function game_end_alt()
{
	if os_browser != browser_not_a_browser {
		window_set_size(0,0);
		surface_resize(application_surface, 0, 0);
		display_set_gui_size(0, 0);
	}
	game_end();	
}