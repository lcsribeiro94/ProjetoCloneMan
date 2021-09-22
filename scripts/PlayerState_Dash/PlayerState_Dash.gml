// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerState_Dash(){
	sprite_index = spritePlayerDash;
	vsp = 0;
	dashsp = 0.25;
	hsp = image_xscale * dashsp;
	var _dashTime = 480;
	
	//show_debug_message("hsp = " + string(_dashTime));
	
	
	while (_dashTime > 0) {
		_dashTime--;
		// H Collision
		if (place_meeting(x+hsp, y, oWall)) {
			while (!place_meeting(x+sign(hsp), y, oWall)) {
				x = x + sign(hsp);
			}
			hsp = 0;
		}
		show_debug_message("hsp = " + string(hsp));
	
	sprite_index = spritePlayerDash;
		x = x + hsp;
	
		if (_dashTime <= 0) state = PLAYERSTATE.FREE;
	}
	
	
}