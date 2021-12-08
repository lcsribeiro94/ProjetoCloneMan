image_alpha = min(image_alpha+0.02,1);
if (keyboard_check_pressed(vk_enter) || gamepad_button_check_pressed(0, gp_start)) {
	
	global.session_time = current_time;
	global.session_time_end = 0;
	global.session_lives = 0;
	global.session_stage = 0;
	global.session_end = 0;
	
	
	randomize();
	roomtogo = irandom(2);
	global.hasUp = false;
	global.hasDown = false;
	global.hasNeutral = false;
	global.lastRoom = RoomTitle;

	switch (roomtogo) {
		case 0:
			global.lastRoom = RoomCave;
			break;
		case 1:
			global.lastRoom = RoomForest;
			break;
		case 2:
			global.lastRoom = RoomSky;
			break;
	}

	room_goto(global.lastRoom);
}