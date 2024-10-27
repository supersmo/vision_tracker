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
	draw_text(room_width/2, room_height/2, string("Left mouse button or left arrow = See whole box\nRight mouse button or right arrow = Don't see whole box\nPress escape to exit and save current results.\n\n\nIteration: {0}\nNumber of test segments: {1}\nGrey area will be tested.",  iteration, iteration_targets));
	reset_draw_properties();
}
