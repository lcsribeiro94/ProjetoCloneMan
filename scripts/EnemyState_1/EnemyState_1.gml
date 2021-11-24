// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function EnemyState_1(){
	/// @description 


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
	
	vsp = vsp + grv;
	
	// V Collision
	if (place_meeting(x, y+vsp, oWall)) {
		while (!place_meeting(x, y+sign(vsp), oWall)) {
			y = y + sign(vsp);
		}
		vsp = 0;
	}
	y = y + vsp;
}