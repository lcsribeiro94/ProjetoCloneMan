var _score = ds_map_create();
ds_map_add(_score, "session_time", string(global.session_time_end));
ds_map_add(_score, "stages", string(global.session_stage));
ds_map_add(_score, "lives", string(global.session_lives));
ds_map_add(_score, "end", string(global.session_end));

var _jsonScore = json_encode(_score);
ds_map_destroy(_score);

var _headerMap = ds_map_create();
ds_map_add(_headerMap, "Content-Type", "application/json");

http_request("http://localhost:80/scores/", "POST", _headerMap, _jsonScore);

ds_map_destroy(_headerMap);