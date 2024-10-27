/// @description Insert description here
// You can write your code in this editor
enum DRAW_STATE
{
    DRAW_ITERATION_INFO,
    DRAW_TARGET,
    DRAW_RESULT,
}

enum RESULT
{
	NOT_DISPLAYED = -1,
	NOT_SEEN = 0,
	SEEN = 1,
}

iteration = 1;
draw_state = DRAW_STATE.DRAW_ITERATION_INFO

var _grid_width = 2;
var _grid_height = 2;
grid_result = ds_grid_create(_grid_width, _grid_height);
ds_grid_clear(grid_result, RESULT.NOT_DISPLAYED);
targets_left = get_occurrences_in_grid(grid_result, RESULT.NOT_DISPLAYED);
grid_cell_width = room_width/_grid_width;
grid_cell_height = room_height/_grid_height;

grid_x = -1;
grid_y = -1;

// Coordinates to draw a target
rect_coordinates = [-1,.1];

// Introduced to only save screenshot during first frame of DRAW_STATE.DRAW_RESULT
should_save_screenshot = false

window_set_cursor(cr_none)
randomise();
