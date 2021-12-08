/// @description Insert description here
// You can write your code in this editor
global.session_time_end = floor((current_time - global.session_time) / 1000);

instance_create_layer(x, y, "Instances", oPostScore);

room_goto(RoomScoreBoard);