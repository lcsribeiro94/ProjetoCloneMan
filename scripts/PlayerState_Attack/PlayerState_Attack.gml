// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerState_Attack(){
	hsp = 0;
	vsp = 0;
	
	ProcessarAtaque(spritePlayerAttack1, sPlayerAttack1HB);
	
	if (key_attack) nextAtk = true;
	
	if(key_dash)
	{
		dashDuration = 15;
		onDash = true;
		vsp = 0;
		hsp = image_xscale * dashsp;
		sprite_index = spritePlayer;
		state = PLAYERSTATE.FREE;
	}
	
	if (animation_end()) {
		if(nextAtk){
			nextAtk = false;
			state = PLAYERSTATE.ATTACK2
		}else{
			sprite_index = spritePlayer;
			state = PLAYERSTATE.FREE;
		}
	}
}