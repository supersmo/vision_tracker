if (mouse_check_button_pressed(mb_left) || keyboard_check_pressed(vk_left)) 
{
	if (draw_state  == DRAW_STATE.DRAW_TARGET) {
		grid_result[# grid_x, grid_y] = RESULT.SEEN;
		set_next_target();
	}
	else if (draw_state == DRAW_STATE.DRAW_ITERATION_INFO) {
		set_next_target();
	}
}
else if (mouse_check_button_pressed(mb_right) || keyboard_check_pressed(vk_right)) 
{
	if (draw_state == DRAW_STATE.DRAW_TARGET) {
		grid_result[# grid_x, grid_y] = RESULT.NOT_SEEN;
		set_next_target();
	}
	else if (draw_state == DRAW_STATE.DRAW_ITERATION_INFO ) {
		set_next_target();
	}
	
}
else if (keyboard_check_pressed(vk_escape))
{
	if (draw_state == DRAW_STATE.DRAW_RESULT) {
		room_goto(rm_main_menu);
	} else {
		// Switch state to draw result
		draw_state = DRAW_STATE.DRAW_RESULT
		
		// Signal to save screenshot in the Draw GUI End event.
		should_save_screenshot = true
	}
}

function set_next_target() 
{
	var _grid_width = ds_grid_width(grid_result);
	var _grid_height = ds_grid_height(grid_result);
	targets_left = get_occurrences_in_grid(grid_result, RESULT.NOT_DISPLAYED);
	if  (targets_left > 0)
	{
		var _target_found = false;
		while (!_target_found) 
		{
			// Get a random cell
			grid_x = irandom(_grid_width -1);
			grid_y = irandom(_grid_height -1);
		
			// If the cell has not been displayed before
			if (grid_result[# grid_x, grid_y] == RESULT.NOT_DISPLAYED)
			{
				// Store the corresponding screen coordinates so the target can be drawn in the draw event
				rect_coordinates = get_coordinates(grid_x, grid_y, ds_grid_width(grid_result), ds_grid_height(grid_result));
				_target_found = true;
				draw_state = DRAW_STATE.DRAW_TARGET
			}
		}
	}
	// End of iteration:
	else
	{
		show_debug_message("result: {0}", grid_to_string(grid_result));
		
		var _grid_to_destroy = grid_result;
		grid_result = double_grid(grid_result);
		show_debug_message("_grid_to_destroy: {0}", grid_to_string(_grid_to_destroy));
		show_debug_message("result: {0}", grid_to_string(grid_result));
		ds_grid_destroy(_grid_to_destroy);
		//show_debug_message("result: {0}", grid_to_string(grid_result));

		iteration++;
		targets_left = get_occurrences_in_grid(grid_result, RESULT.NOT_DISPLAYED);
		
		draw_state = DRAW_STATE.DRAW_ITERATION_INFO
		
	}
}

function get_coordinates(_grid_x, _grid_y, _grid_width, _grid_height) {
	var _grid_cell_width = room_width / _grid_width;
	var _grid_cell_height = room_height / _grid_height;
	var _x1 = _grid_x * _grid_cell_width;
	var _y1 = _grid_y * _grid_cell_height;
	var _x2 = _x1 + _grid_cell_width;
	var _y2 = _y1 + _grid_cell_height;
	return [_x1, _y1, _x2, _y2];
}

function double_grid(_grid) {
	var _grid_width = ds_grid_width(_grid);
	var _grid_height = ds_grid_height(_grid);
	
	// Create a new grid twice as big as the previous
	var _new_grid = ds_grid_create(_grid_width * 2, _grid_height * 2);
	ds_grid_clear(_new_grid, RESULT.NOT_DISPLAYED);
	
	// Transfer SEEN from previous iteration
	for (var _i = 0; _i < _grid_width; _i += 1) {
		for (var _j = 0; _j < _grid_height; _j += 1) {
			if (_grid[# _i, _j] == RESULT.SEEN) {
				ds_grid_set_region(_new_grid, _i * 2, _j * 2, _i * 2 + 1, _j * 2 + 1, RESULT.SEEN);
			}
		}
	}
	
	// Mark NOT_SEEN if surrounding targets are not seen
	for (var _i = 0; _i < _grid_width; _i += 1) {
		for (var _j = 0; _j < _grid_height; _j += 1) {
			var _x1 = max(_i - 1, 0)
			var _y1 = max(_j - 1, 0)
			var _x2 = min(_i + 1, _grid_width)
			var _y2 = min(_j + 1, _grid_height)
			if (ds_grid_get_max(_grid, _x1, _y1, _x2, _y2) == RESULT.NOT_SEEN) {
				ds_grid_set_region(_new_grid, _i * 2, _j * 2, _i * 2 + 1, _j * 2 + 1, RESULT.NOT_SEEN);
			}
		}
	}
	
	return _new_grid
}