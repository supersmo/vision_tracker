/// @description Insert description here
// You can write your code in this editor
should_draw_circle = false;

max_times = 1;
/*
grid_width = 16;
grid_height = 9;
*/
grid_width = 3;
grid_height = 3;

grid_cell_width = room_width/grid_width;
grid_cell_height = room_height/grid_height;

grid_result = ds_grid_create(grid_width, grid_height);
grid_times_shown = ds_grid_create(grid_width, grid_height);

grid_x = 0;
grid_y = 0;

randomise();
