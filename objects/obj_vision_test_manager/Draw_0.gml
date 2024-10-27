/// @description Insert description here
// You can write your code in this editor

switch (draw_state) 
{
	case DRAW_STATE.DRAW_ITERATION_INFO:
		draw_result(grid_result, true);
		break;
    case DRAW_STATE.DRAW_TARGET:
		//Draw target
		draw_set_color(c_white);
		draw_rectangle(rect_coordinates[0], rect_coordinates[1], rect_coordinates[2], rect_coordinates[3], false);
		
		//Draw progress indicator
		draw_pie(room_width/2, room_height/2, iteration_targets - targets_left, iteration_targets, c_purple, 50, 1);
        break;
	case DRAW_STATE.DRAW_RESULT:
		draw_result(grid_result, false);
		break;
    default:
        break;
}

reset_draw_properties();