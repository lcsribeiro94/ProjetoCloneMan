// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerState_Attack2(){
	hsp = 0;
	vsp = 0;
	
	ProcessarAtaque(spritePlayerAttack2, sPlayerAttack2HB);
	
	if (key_attack && image_index > 1) nextAtk = true;
	
	if (animation_end()) {
		sprite_index = spritePlayer;
		if(nextAtk){
			nextAtk = false;
			state = PLAYERSTATE.ATTACK3;
		}else{
			state = PLAYERSTATE.FREE;
		}
	}
}