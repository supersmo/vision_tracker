/// @description Insert description here
// You can write your code in this editor

switch (draw_state) 
{
    case DRAW_STATE.DRAW_CIRCLE:
		draw_set_colour(c_white);
	    draw_circle(circle_coordinates[0], circle_coordinates[1], grid_cell_width/2, false);		
        break;
	case DRAW_STATE.DRAW_RESULT:
		draw_result(grid_result);
		break;
    default:
        break;
}