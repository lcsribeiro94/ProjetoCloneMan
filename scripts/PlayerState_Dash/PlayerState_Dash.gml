// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerState_Dash(){
	sprite_index = spritePlayerDash;
	vsp = 0;
	hsp = dashsp;
	
	// H Collision
	if (place_meeting(x+hsp, y, oWall)) {
		while (!place_meeting(x+sign(hsp), y, oWall)) {
			x = x + sign(hsp);
		}
		hsp = 0;
	}
	x = x + hsp;
	
	if (image_index >= image_number - 1) state = PLAYERSTATE.FREE;
}