// Set to fullscreen
window_set_size(1920, 1080);
global.is_fullscreen=true;
window_set_fullscreen(global.is_fullscreen);

function draw_result(_grid_result) 
{
	draw_clear(c_black)
	draw_set_colour(c_white);
	for (var _x=0; _x < ds_grid_width(_grid_result); _x++)
	{
		for (var _y=0; _y < ds_grid_height(_grid_result); _y++)
		{
			val = _grid_result[# _x,_y]
			var _coordinates = get_coordinates(_x, _y, grid_cell_width, grid_cell_height)
			draw_set_alpha((max_attempts - val)/max_attempts);
			draw_circle(_coordinates[0], _coordinates[1], grid_cell_width/2, false);
	    };
	};
	draw_set_alpha(1)
	draw_set_colour(c_white);
}

function save_result_as_image() 
{
	var _date_as_string = date_datetime_string(date_current_datetime())
	var _file_name = string_replace_all(_date_as_string, ":", ".") + ".png"
	show_debug_message("Saving {0}", _file_name);
	screen_save("Results\\" + _file_name + ".png");
}
