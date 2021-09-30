// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerState_SpecialNeutralAir(){
	
	image_speed = 1;
	
	var move = key_right - key_left;
	
	if(dashJump){
			var inst = instance_create_layer(x, y, "Instances", oPlayerAfterImage);
			inst.sprite_index = sprite_index;
			inst.image_index = image_index;
			inst.image_xscale = image_xscale;
		}
	
	if(dashDuration <= 0 && !dashJump){
	/*if(!onDash){
		hsp = move * hspAcc;
		hsp = clamp(hsp, -hspMax, hspMax);
	}*/
		hsp = move * hspAcc;
	}else{
		if((move > 0 && hsp < 0) || (move < 0 && hsp > 0)){
				hsp = hsp * -1;
				dashActualSpeed = dashActualSpeed * -1;
		}
	}
	
	var _grvFinal = grv;
	
	if (onWall != 0) && (vsp > 0) {
		_grvFinal = grvWall;
		if(vsp < vspWall){
			vsp = vsp + _grvFinal;
		}else{
			vsp = vspWall;
		}
		
	}else if (vsp < vspMax) vsp = vsp + _grvFinal;
	
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
		var inst = instance_create_layer(x, y, "Instances", oAttackProjectile);
		inst.sprite_index = sPlayerSpecialNeutral;
		inst.image_xscale = image_xscale;
		inst.orientation = image_xscale;
		vsp = 0;				
		image_speed = 0;
		sprite_index = spritePlayer;
		state = PLAYERSTATE.FREE;
	}
	y = y + vsp;
	
	ProcessarAtaque(spritePlayerAttackAir, sPlayerAttackAirHB);
	
	if (hsp != 0) image_xscale = sign(hsp);
	//if (key_attack && image_index > 1) state = PLAYERSTATE.ATTACK2;
	
	if (animation_end()) {
		specialNeutralAtkCooldown = 60;
		var inst = instance_create_layer(x, y, "Instances", oAttackProjectile);
		inst.sprite_index = sPlayerSpecialNeutral;
		inst.image_xscale = image_xscale;
		inst.orientation = image_xscale;
		image_speed = 0;
		sprite_index = spritePlayer;
		state = PLAYERSTATE.FREE;
	}
}