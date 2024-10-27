if (keyboard_check_pressed(vk_enter) && keyboard_check(vk_alt))
{
	global.is_fullscreen = !global.is_fullscreen;
	window_set_fullscreen(global.is_fullscreen);
}

if (keyboard_check_pressed(vk_escape)) 
{
	//rm_eye_test already handles escape presses
	if (room != rm_eye_test) {
		room_goto(rm_main_menu);
	}
}
