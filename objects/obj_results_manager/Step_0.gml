if (current_file_index < 0)
{
	// Todo: Draw text about no results
}

// Load previous result
else if (mouse_check_button_pressed(mb_left) || keyboard_check_pressed(vk_left))
{
	if (current_file_index > 0)
	{
		current_file_index--
		sprite_replace(sprite_result, result_files[current_file_index], 1, false, false, 0, 0);
	}
}

else if (mouse_check_button_pressed(mb_right) || keyboard_check_pressed(vk_right))
{
	if (current_file_index < array_length(result_files) - 1)
	{
		current_file_index++
		sprite_replace(sprite_result, result_files[current_file_index], 1, false, false, 0, 0);
		
	}
}
