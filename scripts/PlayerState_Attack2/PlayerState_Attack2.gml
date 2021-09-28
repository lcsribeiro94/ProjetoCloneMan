// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerState_Attack2(){
	hsp = 0;
	vsp = 0;
	
	ProcessarAtaque(spritePlayerAttack2, sPlayerAttack2HB);
	
	if (key_attack && image_index > 1) nextAtk = true;
	
	if(key_dash)
	{
		dashDuration = 15;
		onDash = true;
		vsp = 0;
		hsp = 0;
		dashActualSpeed = image_xscale * 0.25;
		sprite_index = spritePlayer;
		state = PLAYERSTATE.FREE;
	}
	
	if (animation_end()) {
		if(nextAtk){
			nextAtk = false;
			state = PLAYERSTATE.ATTACK3;
		}else{
			atkCooldown = 5;
			sprite_index = spritePlayer;
			state = PLAYERSTATE.FREE;
		}
	}
}