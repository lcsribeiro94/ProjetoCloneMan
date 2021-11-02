/// @description Aqui é controlado o comportamento do jogador.

//healthbar_x = camera_get_view_x(view_camera[0]) + 10;
//healthbar_y = camera_get_view_y(view_camera[0]) + 150;

key_up = keyboard_check(vk_up);
key_down = keyboard_check(vk_down);
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_jump = keyboard_check_pressed(vk_space);
key_dash = keyboard_check_pressed(vk_lshift);
key_dash_hold = keyboard_check(vk_lshift);
key_attack = keyboard_check_pressed(ord("Z"));
key_special = keyboard_check_pressed(ord("X"));
key_debug = keyboard_check_pressed(ord("P"));
if(key_debug){
	state = PLAYERSTATE.FREE;
}
if(hp != old_hp){
	if(hp < old_hp){
		hsp = -sign(image_xscale) * 3;
		vsp = -3;
		inv_frame = true;
		inv_frameDuration = 60;
		state = PLAYERSTATE.TAKEHIT;
	}
	old_hp = hp;
}
if(inv_frameDuration == 0){
	inv_frame = false;
	image_alpha = 1;
}else{
	if(inv_frameDuration % 2 == 0)
	if(inv_frameAlpha == 0){
		inv_frameAlpha = 1;
	}else{
		inv_frameAlpha = 0;
	}
	image_alpha = inv_frameAlpha;
}
inv_frameDuration = max(inv_frameDuration - 1, 0);
//show_debug_message("hsp = " + string(hsp));
	//show_debug_message("vsp = " + string(vsp));


switch (state) {
	case PLAYERSTATE.FREE:
		PlayerState_Free();
		break;
	case PLAYERSTATE.ATTACK1:
		PlayerState_Attack();
		break;
	case PLAYERSTATE.ATTACK2:
		PlayerState_Attack2();
		break;
	case PLAYERSTATE.ATTACK3:
		PlayerState_Attack3();
		break;
	case PLAYERSTATE.ATTACKAIR:
		PlayerState_AttackAir();
		break;
	case PLAYERSTATE.SPECIALNEUTRAL:
		PlayerState_SpecialNeutral();
		break;
	case PLAYERSTATE.SPECIALNEUTRALAIR:
		PlayerState_SpecialNeutralAir();
		break;
	case PLAYERSTATE.SPECIALAIRUP:
		PlayerState_SpecialAirUp();
		break;
	case PLAYERSTATE.SPECIALAIRDOWN:
		PlayerState_SpecialAirDown();
		break;	
	case PLAYERSTATE.TAKEHIT:
		PlayerState_takeHit();
		break;
}

