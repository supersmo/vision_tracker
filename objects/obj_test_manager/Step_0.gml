/// @description Insert description here
// You can write your code in this editor


if mouse_check_button_pressed(mb_left) {
	ds_grid_add(grid_result, grid_x, grid_y, 1);
	show_debug_message(ds_grid_write(grid_result));
	set_next_circle();
	
} 
else if mouse_check_button_pressed(mb_right) {
	set_next_circle();
}

function set_next_circle() {
	var _circles_left = ds_grid_get_min(grid_times_shown, 0, 0, grid_width, grid_height) < max_times;
	if  _circles_left {
		
		var _circle_found = false;
		while !_circle_found {
			grid_x = irandom(grid_width -1);
			grid_y = irandom(grid_height -1);
		
			if ds_grid_get(grid_times_shown, grid_x, grid_y) < max_times {
					circle_x = grid_x * grid_cell_width + grid_cell_width/2;
					circle_y = grid_y * grid_cell_height + grid_cell_height/2;
				ds_grid_add(grid_times_shown, grid_x, grid_y, 1);
				_circle_found = true;
			}
		}
	}
	// End of test
	else {
		save_result(grid_result);
		room_goto(rm_results);
	}
		
	should_draw_circle = true;
	
	show_debug_message("grid: {0},{1}; coordinates: {2}, {3})", grid_x, grid_y, circle_x, circle_y);
}