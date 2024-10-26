/// @description Insert description here
// You can write your code in this editor

switch (draw_state) 
{
    case DRAW_STATE.DRAW_TARGET:
		draw_set_colour(c_white);
		draw_rectangle(rect_coordinates[0], rect_coordinates[1], rect_coordinates[2], rect_coordinates[3], false);
        break;
	case DRAW_STATE.DRAW_RESULT:
		draw_result(grid_result);
		break;
    default:
        break;
}
