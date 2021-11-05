// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerState_takeHit(){
	var _grvFinal = grv;
	
	if (onWall != 0) && (vsp > 0) {
		_grvFinal = grvWall;
		if(vsp < vspWall){
			vsp = vsp + _grvFinal;
		}else{
			vsp = vspWall;
		}
		
	}else if (vsp < vspMax) vsp = vsp + _grvFinal;
	
	hsp = clamp(hsp, -hspMax, hspMax);
	
	var hsp_final = hsp + hspCarry;
	hspCarry = 0;
	
	// H Collision
	if (place_meeting(x+hsp_final, y, oWall)) {
		while (!place_meeting(x+sign(hsp_final), y, oWall)) {
			x = x + sign(hsp_final);
		}
		hsp_final = 0;
	}
	x = x + hsp_final;

	// V Collision
	if (place_meeting(x, y+vsp, oWall)) {
		while (!place_meeting(x, y+sign(vsp), oWall)) {
			y = y + sign(vsp);
		}
		vsp = 0;
	}
	y = y + vsp;
	if(inv_frameDuration <= 45){
		state = PLAYERSTATE.FREE;
	}
}