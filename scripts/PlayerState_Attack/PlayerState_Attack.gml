// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerState_Attack(){
	hsp = 0;
	vsp = 0;
	
	ProcessarAtaque(spritePlayerAttack1, sPlayerAttack1HB);
	
	if (key_attack && image_index > 2) state = PLAYERSTATE.ATTACK2;
	
	if (animation_end()) {
		sprite_index = spritePlayer;
		state = PLAYERSTATE.FREE;
	}
}