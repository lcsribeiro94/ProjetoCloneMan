// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerState_Dash(){
	sprite_index = spritePlayerDash;
	vsp = 0;
	hsp = image_xscale * dashsp;
	var _dashTime = 120;
	
	while (_dashTime > 0) {
		_dashTime--;
	}
	
	// H Collision
	if (place_meeting(x+hsp, y, oWall)) {
		while (!place_meeting(x+sign(hsp), y, oWall)) {
			x = x + sign(hsp);
		}
		hsp = 0;
	}
	x = x + hsp;
	
	if (_dashTime <= 0) state = PLAYERSTATE.FREE;
}

