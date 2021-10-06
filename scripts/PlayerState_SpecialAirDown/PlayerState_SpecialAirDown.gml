// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerState_SpecialAirDown(){
	
	
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
		
		dashActualSpeed = dashActualSpeed * dashAcc;
		if(dashJump){
			hsp = (hsp + dashActualSpeed) * abs(move);
		}else{
			hsp = hsp + dashActualSpeed;
		}
		
		if(hsp * image_xscale > dashsp){
			hsp = dashsp * image_xscale;
		}
		if((move > 0 && hsp < 0) || (move < 0 && hsp > 0)){
				hsp = hsp * -1;
				dashActualSpeed = dashActualSpeed * -1;
		}
	}
	
	hsp = clamp(hsp, -hspMax, hspMax);
	var _grvFinal = grv;
	
	if (onWall != 0) && (vsp > 0) {
		_grvFinal = grvWall;
		if(vsp < vspWall){
			vsp = vsp + _grvFinal;
		}else{
			vsp = vspWall;
		}
		
	}else if (vsp < (vspMax + (vspMax * specialDownEnhancer))){ 
		
		vsp = vsp + (_grvFinal + (_grvFinal * specialDownEnhancer));
	};
	
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
		specialDownEnhancer = 0;
		vsp = 0;				
		image_speed = 0;
		sprite_index = spritePlayer;
		state = PLAYERSTATE.FREE;
	}
	y = y + vsp;
	
	if (sprite_index != spritePlayerSpecialAirDown) {
		sprite_index = spritePlayerSpecialAirDown;
		image_index = 0;
		ds_list_clear(enemiesHit);
	}
	
	ProcessarAtaque(spritePlayerSpecialAirDown, sPlayerSpecialAirDownHB, -7.5);
	
	if(vsp > 0){		
		ds_list_clear(enemiesHit);
	}
	
	/*
	// Atualizando hitbox e verificando inimigos atingidos
	
	mask_index = sPlayerSpecialAirDownHB;
	var _enemiesHitNow = ds_list_create();
	var _hits = instance_place_list(x, y, oEnemy, _enemiesHitNow, false);
	if (_hits > 0) {
		for (var i = 0; i < _hits; i++) {			
			vsp = -7.5;
			// Checando se o inimigo já foi atingido neste frame
			var _hitID = _enemiesHitNow[| i];
			if (ds_list_find_index(enemiesHit, _hitID) == -1) {
				ds_list_add(enemiesHit, _hitID);
				with (_hitID) {
					// Definindo o que o ataque faz ao inimigo
					hp--;
				}
			}
		}
	}
	ds_list_destroy(_enemiesHitNow);
	if(vsp < 0){
		ds_list_clear(enemiesHit);
	}
	mask_index = spritePlayer;
	*/
	if (hsp != 0) image_xscale = sign(hsp);
	/*
	if(key_dash)
	{
		dashDuration = 15;
		onDash = true;
		vsp = 0;
		hsp = 0;
		dashActualSpeed = image_xscale * 0.25;
		sprite_index = spritePlayer;
		state = PLAYERSTATE.FREE;
	}*/
	//if (key_attack && image_index > 1) state = PLAYERSTATE.ATTACK2;
	/*
	if (animation_end()) {
		image_speed = 0;
		sprite_index = spritePlayer;
		state = PLAYERSTATE.FREE;
	}
	*/
	
	
	if(key_down && key_special){
		specialDownEnhancer += 1;
		specialDownEnhancer = clamp(specialDownEnhancer, 0, specialDownEnhancerMax);
	}
}