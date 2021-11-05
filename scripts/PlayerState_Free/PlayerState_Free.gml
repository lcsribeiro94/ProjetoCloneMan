// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
//commit change
function PlayerState_Free(){
	
	dashDuration = max(dashDuration - 1, 0);
	dashCooldown = max(dashCooldown - 1, 0);
	wallJumpDuration = max(wallJumpDuration - 1, 0);
	atkCooldown = max(atkCooldown - 1, 0);
	specialNeutralAtkCooldown = max(specialNeutralAtkCooldown - 1, 0);
	specialUpAtkCooldown = max(specialUpAtkCooldown - 1, 0);
	specialDownEnhancer = 0;
	
	if(dashDuration == 1){
		dashCooldown = 15;
	}
	// H Speed
	var move = key_right - key_left;
	if(wallJumpDuration > 0){	
		if(dashJump){
			var inst = instance_create_layer(x, y, "Instances", oPlayerAfterImage);
			inst.sprite_index = sprite_index;
			inst.image_index = image_index;
			inst.image_xscale = image_xscale;
		}
	}else if(dashDuration <= 0 && !dashJump){
	/*if(!onDash){
		hsp = move * hspAcc;
		hsp = clamp(hsp, -hspMax, hspMax);
	}*/
		hsp = move * hspAcc;
	}else{
		var inst = instance_create_layer(x, y, "Instances", oPlayerAfterImage);
		inst.sprite_index = sprite_index;
		inst.image_index = image_index;
		inst.image_xscale = image_xscale;
		
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
		
	// Wall jump
	if (onWall != 0) && (!onGround) && (key_jump) {
		dashDuration = 0;
		wallJumpDuration = 10;
		hsp = move * -hspWall * onWall;
		vsp = vspWallJ;
		if(key_dash_hold){
			dashJump = true;
			hsp = move * -dashsp * onWall;
		}
	}
	
	
	if (key_dash && dashCooldown == 0 && dashDuration == 0 && !dashJump) {
		//state = PLAYERSTATE.DASH;
		dashDuration = 15;
		onDash = true;
		vsp = 0;
		hsp = 0;
		dashActualSpeed = image_xscale;
		
		
		/*while (_dashTime > 0) {
			_dashTime--;
			if (_dashTime <= 0) onDash = false;
		}*/
		
	}
	// V Speed
	var _grvFinal = grv;
	
	if (onWall != 0) && (vsp > 0) {
		_grvFinal = grvWall;
		if(vsp < vspWall){
			vsp = vsp + _grvFinal;
		}else{
			vsp = vspWall;
		}
		
	}else if (vsp < vspMax) vsp = vsp + _grvFinal;
	
	if(((onWall != 0 && wallJumpDuration == 0) || onGround)){
		if(dashJump && dashDuration == 0){
			dashJump = false;
		}
		if(specialUpAtkCooldown == 0){
			specialUpAtk = false;
		}
	}
	
	// Jump
	if (onGround && key_jump) {
		vsp = -10;
		if(dashDuration > 0 || key_dash_hold){
			dashDuration = 3;
			dashJump = true;
		}
	}
	
	
	// Check Status
	onGround = place_meeting(x, y+1, oWall);
	onWall = place_meeting(x+hsp, y, oWall) - place_meeting(x-hsp, y, oWall);
	
	var hsp_final = hsp + hspCarry;

	// H Collision
	if (place_meeting(x+hsp_final, y, oWall)) {
		while (!place_meeting(x+sign(hsp_final), y, oWall)) {
			x = x + sign(hsp_final);
		}
		hsp_final = hspCarry;
	}
	x = x + hsp_final;
	hspCarry = 0;

	// V Collision
	if (place_meeting(x, y+vsp, oWall)) {
		while (!place_meeting(x, y+sign(vsp), oWall)) {
			y = y + sign(vsp);
		}
		vsp = 0;
	}
	y = y + vsp;
	
	// Updating sprites
	/*if (!onDash){
		if (!onGround) {
			if (onWall != 0) {
				sprite_index = spritePlayerWall;
				image_speed = 0;
			}
			else {
				sprite_index = spritePlayerJump;
				image_speed = 0;
				if (sign(vsp) > 0) image_index = 1;
				else image_index = 0;
			}
		}
		else {
			image_speed = 1;
			if (hsp == 0) {
				sprite_index = spritePlayer;
			}
			else {
				sprite_index = spritePlayerWalk;
			}
		}
	}*/
	if(dashDuration > 0){
		sprite_index = spritePlayerDash;
		if (dashDuration >= 10) image_index = 0;
		else image_index = 1;
	}else if (!onGround) {
		if (onWall != 0) {
			sprite_index = spritePlayerWall;
			image_speed = 0;
		}
		else {
			sprite_index = spritePlayerJump;
			image_speed = 0;
			if (sign(vsp) > 0) image_index = 1;
			else image_index = 0;
		}
	}
	else {
		image_speed = 1;
		if (hsp == 0) {
			sprite_index = spritePlayer;
		}
		else {
			sprite_index = spritePlayerWalk;
		}
	}
	if (hsp != 0) image_xscale = sign(hsp);
	
	if (key_attack && onGround && atkCooldown = 0) {
		dashDuration = 0;
		state = PLAYERSTATE.ATTACK1;		
	}
	if (key_attack && !onGround && !onWall){		
		state = PLAYERSTATE.ATTACKAIR;
	}
	if(key_special && atkCooldown = 0 && !onWall && !key_up && specialNeutralAtkCooldown == 0){
		if(onGround){
			state = PLAYERSTATE.SPECIALNEUTRAL;
		}else{
			state = PLAYERSTATE.SPECIALNEUTRALAIR;
		}
	}
	if(key_special && atkCooldown = 0 && !onWall && key_up && !specialUpAtk && specialUpAtkCooldown == 0){
		if(dashDuration > 0 || key_dash_hold){
			dashDuration = 15;
			dashJump = true;
		}
		specialUpAtk = true;
		state = PLAYERSTATE.SPECIALAIRUP;
	}
	if(key_special && atkCooldown = 0 && !onWall && !onGround && key_down){
		
		state = PLAYERSTATE.SPECIALAIRDOWN;
	}
}