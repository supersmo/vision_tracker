/// @description Insert description here
// You can write your code in this editor
sprite_result = noone

result_files = noone
current_file_index = -1;


function get_result_image_files()
{
	var _files = [];
	var _file_name = file_find_first(RESULTS_PATH + "/*", fa_none);

	show_debug_message("Directory: {0}. First file: {1}", RESULTS_PATH, _file_name);

	while (_file_name != "")
	{
	    array_push(_files, RESULTS_PATH + _file_name);
	    _file_name = file_find_next();
	}

	file_find_close();
	return _files;
}


result_files = get_result_image_files();
current_file_index = array_length(result_files) -1;

if (current_file_index >= 0)
{
	show_debug_message(result_files[current_file_index]);
	sprite_result = sprite_add(result_files[current_file_index], 1, false, false, 0, 0)
}