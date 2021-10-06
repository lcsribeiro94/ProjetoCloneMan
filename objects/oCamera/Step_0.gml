/// @description Update Camera

//Update Destination
if(instance_exists(follow)){
	xTo = follow.x;
	yTo = follow.y;
}

x_move = (xTo - x) / 15;
y_move = (yTo - y) / 5;

x += x_move;
y += y_move;

x = clamp(x, view_w_half, room_width - view_w_half);
y = clamp(y, view_h_half, room_height - view_h_half_complement);

camera_set_view_pos(cam,x-view_w_half,y-view_h_half);