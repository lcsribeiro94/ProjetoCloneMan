global.session_end = 1;
global.session_time_end = floor((current_time - global.session_time) / 1000);

instance_create_layer(x, y, "Instances", oPostScore);