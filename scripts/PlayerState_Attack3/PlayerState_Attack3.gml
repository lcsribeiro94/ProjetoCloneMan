// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerState_Attack3(){
	hsp = 0;
	vsp = 0;
	
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
	
	ProcessarAtaque(spritePlayerAttack3, sPlayerAttack3HB);
	
	//if (key_attack && image_index > 1) state = PLAYERSTATE.ATTACK2;
	
	if (animation_end()) {
		atkCooldown = 5;
		sprite_index = spritePlayer;
		state = PLAYERSTATE.FREE;
	}
}