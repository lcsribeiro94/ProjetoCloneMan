// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerState_Free(){
	
	dashDuration = max(dashDuration - 1, 0);
	dashCooldown = max(dashCooldown - 1, 0);
	wallJumpDuration = max(wallJumpDuration - 1, 0);
	
	
	if(dashDuration == 1){
		dashCooldown = 15;
	}
	// H Speed
	var move = key_right - key_left;
	if(wallJumpDuration > 0){	
	}else if(dashDuration <= 0){
	/*if(!onDash){
		hsp = move * hspAcc;
		hsp = clamp(hsp, -hspMax, hspMax);
	}*/
		hsp = move * hspAcc;
		hsp = clamp(hsp, -hspMax, hspMax);
	}else{
		if((move > 0 && hsp < 0) || (move < 0 && hsp > 0)){
				hsp = hsp * -1;
		}
	}
	
	// Wall jump
	if (onWall != 0) && (!onGround) && (key_jump) {
		wallJumpDuration = 10;
		hsp = move * -hspWall * onWall;
		vsp = vspWallJ;
	}
	
	
	if (key_dash && dashCooldown == 0 && dashDuration == 0) {
		//state = PLAYERSTATE.DASH;
		dashDuration = 15;
		onDash = true;
		vsp = 0;
		hsp = image_xscale * dashsp;
		
		
		/*while (_dashTime > 0) {
			_dashTime--;
			if (_dashTime <= 0) onDash = false;
		}*/
		
	}
	// V Speed
	var _grvFinal = grv;
	
	if (onWall != 0) && (vsp > 0) {
		_grvFinal = grvWall;
		if(vsp < vspWall){
			vsp = vsp + _grvFinal;
		}else{
			vsp = vspWall;
		}
		
	}else if (vsp < vspMax) vsp = vsp + _grvFinal;
	
	// Jump
	if (onGround && key_jump) {
		vsp = -10;
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
	/*if (!onDash){
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
	}*/
	if(dashDuration > 0){
		sprite_index = spritePlayerDash;
	}else if (!onGround) {
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
	if (hsp != 0) image_xscale = sign(hsp);
	
	
}