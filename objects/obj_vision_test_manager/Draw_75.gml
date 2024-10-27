if (should_save_screenshot)
{
	save_result_as_image();
	should_save_screenshot = false;
}

if (draw_state = DRAW_STATE.DRAW_ITERATION_INFO) {
	draw_set_font(fnt_menu);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_colour(c_yellow);
	draw_text(room_width/2, room_height/2, string("Iteration: {0}\nGrey area will be tested.\nNumber of test points: {1}\nPress escape to exit and save current results.",  iteration, iteration_targets));
	reset_draw_properties();
}
