// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function EnemyState_takeHit(){
	var _grvFinal = grv;
	
	vsp = vsp + _grvFinal;
	
	if (place_meeting(x+hsp, y, oWall)) {
		while (!place_meeting(x+sign(hsp), y, oWall)) {
			x = x + sign(hsp);
		}
		hsp *= -1;
	}
	if (place_meeting(x+(hsp), y, oWallBounce)) {
		while (!place_meeting(x+sign(hsp), y, oWallBounce)) {
			x = x + sign(hsp);
		}
		hsp *= -1;
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
	if(inv_frameDuration <= 0){
		hsp = -sign(hsp) * 3;
		state = ENEMYSTATE.FREE;
	}
}