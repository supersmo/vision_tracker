if (mouse_check_button_pressed(mb_left)) 
{
	if (draw_state  == DRAW_STATE.DRAW_TARGET) {
		ds_grid_set(grid_result, grid_x, grid_y, RESULT.SEEN);
		set_next_target();
	}
	else if (draw_state == DRAW_STATE.DRAW_NONE) {
		set_next_target();
	}
}
else if (mouse_check_button_pressed(mb_right)) 
{
	if (draw_state == DRAW_STATE.DRAW_NONE || draw_state == DRAW_STATE.DRAW_TARGET) {
		ds_grid_set(grid_result, grid_x, grid_y, RESULT.NOT_SEEN);
		set_next_target();
	}
}

function set_next_target() 
{
	var _targets_left = ds_grid_get_min(grid_result, 0, 0, grid_width, grid_height) == RESULT.NOT_DISPLAYED;
	if  (_targets_left)
	{
		var _target_found = false;
		while (!_target_found) 
		{
			// Get a random cell
			grid_x = irandom(grid_width -1);
			grid_y = irandom(grid_height -1);
		
			// If the cell has not been displayed before
			if (ds_grid_get(grid_result, grid_x, grid_y) == RESULT.NOT_DISPLAYED)
			{
				// Store the corresponding screen coordinates so the target can be drawn in the draw event
				rect_coordinates = get_coordinates(grid_x, grid_y, grid_cell_width, grid_cell_height);
				_target_found = true;
				draw_state = DRAW_STATE.DRAW_TARGET
			}
		}
	}
	// End of vision test
	else
	{
		show_debug_message( "-----");
		for( var _i = 0; _i < ds_grid_height( grid_result); ++_i){
		    var _str = "";
		    for( var _j = 0; _j < ds_grid_width( grid_result); ++_j){
		       _str += string( grid_result[# _j, _i]) + "\t\t";
		    }
		    show_debug_message( _str);
		}
		show_debug_message( "-----");
		
		// Switch state to draw result
		draw_state = DRAW_STATE.DRAW_RESULT
		
		// Signal to save screenshot in the Draw GUI End event.
		should_save_screenshot = true

		//room_goto(rm_results);
	}
}

function get_coordinates(_grid_x, _grid_y, _grid_cell_width, _grid_cell_height) {
	var _x1 = _grid_x * _grid_cell_width;
	var _y1 = _grid_y * _grid_cell_height;
	var _x2 = _x1 + _grid_cell_width;
	var _y2 = _y1 + _grid_cell_height
	return [_x1, _y1, _x2, _y2];
}
