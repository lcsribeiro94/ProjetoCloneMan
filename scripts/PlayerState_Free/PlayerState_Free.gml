// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerState_Free(){
	
	
	// H Speed
	var move = key_right - key_left;
	hsp = move * hspAcc;
	hsp = clamp(hsp, -hspMax, hspMax);
	
	// Wall jump
	if (onWall != 0) && (!onGround) && (key_jump) {
		hsp = -hspWall * onWall;
		vsp = vspWall;
	}
	
	// V Speed
	var _grvFinal = grv;
	
	if (onWall != 0) && (vsp > 0) {
		_grvFinal = grvWall;
	}
	
	if (vsp < vspMax) vsp = vsp + _grvFinal;
	
	// Jump
	if (onGround && key_jump) {
		vsp = -10;
	}
	
	// Dash
	var _dashTime = 120;
	if (key_dash) {
		onDash = true;
		vsp = 0;
		hsp = image_xscale * dashsp;
	
		while (_dashTime > 0) {
			_dashTime--;
			if (_dashTime <= 0) onDash = false;
		}
	}
	
	// Check Status
	onGround = place_meeting(x, y+1, oWall);
	onWall = place_meeting(x+hsp, y, oWall) - place_meeting(x-hsp, y, oWall);

	// H Collision
	if (place_meeting(x+hsp, y, oWall)) {
		while (!place_meeting(x+sign(hsp), y, oWall)) {
			x = x + sign(hsp);
		}
		hsp = 0;
	}
	x = x + hsp;

	// V Collision
	if (place_meeting(x, y+vsp, oWall)) {
		while (!place_meeting(x, y+sign(vsp), oWall)) {
			y = y + sign(vsp);
		}
		vsp = 0;
	}
	y = y + vsp;
	
	// Updating sprites
	if (!onDash){
		if (!onGround) {
			if (onWall != 0) {
				sprite_index = spritePlayerWall;
				image_speed = 0;
			}
			else {
				sprite_index = spritePlayerJump;
				image_speed = 0;
				if (sign(vsp) > 0) image_index = 1;
				else image_index = 0;
			}
		}
		else {
			image_speed = 1;
			if (hsp == 0) {
				sprite_index = spritePlayer;
			}
			else {
				sprite_index = spritePlayerWalk;
			}
		}
	}
	if (hsp != 0) image_xscale = sign(hsp);
	
	
}