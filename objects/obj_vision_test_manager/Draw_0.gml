/// @description Insert description here
// You can write your code in this editor

switch (draw_state) 
{
	case DRAW_STATE.DRAW_ITERATION_INFO:
		draw_result(grid_result, true);
		draw_set_font(fnt_menu);
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_set_colour(c_green);
		draw_text(room_width/2, room_height/2, string("Iteration: {0}\nGrey area will be tested.\nNumber of test points: {1}\nPress escape to exit and save current results.",  iteration, targets_left));
		break;
    case DRAW_STATE.DRAW_TARGET:
		draw_set_colour(c_white);
		draw_rectangle(rect_coordinates[0], rect_coordinates[1], rect_coordinates[2], rect_coordinates[3], false);
        break;
	case DRAW_STATE.DRAW_RESULT:
		draw_result(grid_result, false);
		break;
    default:
        break;
}
