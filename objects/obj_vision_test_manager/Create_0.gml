/// @description Insert description here
// You can write your code in this editor
enum DRAW_STATE
{
    DRAW_NONE,
    DRAW_CIRCLE,
    DRAW_RESULT,
}

draw_state = DRAW_STATE.DRAW_NONE

max_attempts = 3;
/*
grid_width = 3;
grid_height = 3;
*/
grid_width = 16;
grid_height = 9;

grid_cell_width = room_width/grid_width;
grid_cell_height = room_height/grid_height;

grid_result = ds_grid_create(grid_width, grid_height);
grid_times_shown = ds_grid_create(grid_width, grid_height);

grid_x = 0;
grid_y = 0;

//Coordinates to draw a circle
circle_coordinates = [0,0];

should_save_screenshot = false

window_set_cursor(cr_none)
randomise();
