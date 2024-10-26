/// @description Insert description here
// You can write your code in this editor
enum DRAW_STATE
{
    DRAW_NONE,
    DRAW_TARGET,
    DRAW_RESULT,
}

enum RESULT
{
	NOT_DISPLAYED = -1,
	NOT_SEEN = 0,
	SEEN = 1,
}

draw_state = DRAW_STATE.DRAW_NONE

grid_width = 16;
grid_height = 9;

grid_result = ds_grid_create(grid_width, grid_height);
ds_grid_set_region(grid_result, 0, 0, grid_width - 1, grid_width - 1, RESULT.NOT_DISPLAYED);

grid_cell_width = room_width/grid_width;
grid_cell_height = room_height/grid_height;

grid_x = 0;
grid_y = 0;

//Coordinates to draw a circle
rect_coordinates = [0,0];

should_save_screenshot = false

window_set_cursor(cr_none)
randomise();
