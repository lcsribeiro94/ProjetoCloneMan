/// @description Setup Camera
cam = view_camera[0];
follow = oPlayer;
y_half_value = 0.7;
view_w_half = camera_get_view_width(cam) * 0.5;
view_h_half = camera_get_view_height(cam) * y_half_value;
view_h_half_complement = camera_get_view_height(cam) * (1 - y_half_value);
xTo = xstart;
yTo = ystart;