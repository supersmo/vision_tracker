#macro RESULTS_PATH game_save_id + "Results\\"

// Set to fullscreen
window_set_size(1920, 1080);
global.is_fullscreen=true;
window_set_fullscreen(global.is_fullscreen);

// Set suerface size to standardize image save size
surface_resize(application_surface, 1920, 1080);

function draw_result(_grid_result, _draw_area_to_test) 
{
	draw_clear(c_black)
	var _color = c_white;
	for (var _x=0; _x < ds_grid_width(_grid_result); _x++)
	{
		for (var _y=0; _y < ds_grid_height(_grid_result); _y++)
		{
			var _value = _grid_result[# _x,_y]
			switch (_value) {
				case RESULT.NOT_DISPLAYED:
					_color = c_white;
				    if (_draw_area_to_test) {
						_alpha = 0.5
					} else {
						_alpha = 1;
					}
					break;
				case RESULT.SEEN:
					_color = c_black;
					_alpha = 1;
					break;
				case RESULT.NOT_SEEN:
					_color = c_white;
					_alpha = 1;
					break;
			} 
			draw_set_color(_color);
			draw_set_alpha(_alpha);
			var _coordinates = get_coordinates(_x, _y, ds_grid_width(grid_result), ds_grid_height(grid_result));
			draw_rectangle(_coordinates[0], _coordinates[1],_coordinates[2], _coordinates[3], false);
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
	surface_save(application_surface, RESULTS_PATH + _file_name)
}

function grid_to_string(_grid)
{
	var _str = "---\n";
	for( var _i = 0; _i < ds_grid_width( _grid); ++_i){
		for( var _j = 0; _j < ds_grid_height( _grid); ++_j){
		    _str += string( _grid[# _i, _j]) + "\t\t";
		}
		_str += "\n"
	}
	_str += "---";
	return _str;
}

function get_occurrences_in_grid(_grid, _val) {
	var _count = 0;
	for( var _i = 0; _i < ds_grid_width( _grid); ++_i){
		for( var _j = 0; _j < ds_grid_height( _grid); ++_j){
		    if (_grid[# _i, _j] == _val) {
				_count++;
			}
		}
	}
	return _count;
}
