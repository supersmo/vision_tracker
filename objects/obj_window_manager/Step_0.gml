/// @description Insert description here
// You can write your code in this editor
if keyboard_check_pressed(vk_enter) && keyboard_check(vk_alt){
	global.is_fullscreen = !global.is_fullscreen;
	window_set_fullscreen(global.is_fullscreen);
}

if keyboard_check_pressed(vk_escape) {
	room_goto(rm_main_menu);
}