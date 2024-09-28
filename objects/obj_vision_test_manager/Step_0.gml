if (mouse_check_button_pressed(mb_left)) 
{
	if (draw_state == DRAW_STATE.DRAW_NONE || draw_state == DRAW_STATE.DRAW_CIRCLE)
	{
		// Store that a circle was seen
		ds_grid_add(grid_result, grid_x, grid_y, 1);
		set_next_circle();
	}
}
else if (mouse_check_button_pressed(mb_right)) 
{
	if (draw_state == DRAW_STATE.DRAW_NONE || draw_state == DRAW_STATE.DRAW_CIRCLE) {
		set_next_circle();
	}
}

function set_next_circle() 
{
	var _circles_left = ds_grid_get_min(grid_times_shown, 0, 0, grid_width, grid_height) < max_attempts;
	if  (_circles_left)
	{
		var _circle_found = false;
		while (!_circle_found) 
		{
			// Get a random cell
			grid_x = irandom(grid_width -1);
			grid_y = irandom(grid_height -1);
		
			// If the cell has been shown less than max times
			if (ds_grid_get(grid_times_shown, grid_x, grid_y) < max_attempts)
			{
				// Record that it has been shown
				ds_grid_add(grid_times_shown, grid_x, grid_y, 1);
				
				// Store the corresponding screen coordinates so the circle can be drawn in the draw event
				circle_coordinates = get_coordinates(grid_x, grid_y, grid_cell_width, grid_cell_height);
				_circle_found = true;
				draw_state = DRAW_STATE.DRAW_CIRCLE
			}
		}
	}
	// End of vision test
	else
	{
		// Switch state to draw result
		draw_state = DRAW_STATE.DRAW_RESULT
		
		// Signal to save screenshot in the Draw GUI End event.
		should_save_screenshot = true

		//room_goto(rm_results);
	}
}

function get_coordinates(_grid_x, _grid_y, _grid_cell_width, _grid_cell_height) {
	var _circle_x = _grid_x * _grid_cell_width + _grid_cell_width/2;
	var _circle_y = _grid_y * _grid_cell_height + _grid_cell_height/2;
	return [_circle_x, _circle_y];
}