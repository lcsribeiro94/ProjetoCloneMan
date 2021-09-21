// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerState_Free(){
	// Movement
	var move = key_right - key_left;
	hsp = move * walksp;
	vsp = vsp + grv;
	if (place_meeting(x,y+1,oWall) && key_jump) {
		vsp = -10;
	}
	
	// Updating Sprite
	var _oldSprite = sprite_index;
	if (hsp != 0) {
		sprite_index = spritePlayerWalk;
	} else sprite_index = spritePlayer;
	if (_oldSprite != sprite_index) localFrame = 0; 

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
}