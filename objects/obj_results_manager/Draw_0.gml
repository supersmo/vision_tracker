/// @description Insert description here
// You can write your code in this editor

if (sprite_result != noone)
{
	draw_sprite(sprite_result, -1, 0, 0);
	draw_set_color(c_green);
	draw_set_font(fnt_menu);
	draw_set_valign(fa_bottom);
	draw_set_halign(fa_right);
	draw_text(room_width -10, room_height -10, filename_name(result_files[current_file_index]));
}
reset_draw_properties();
