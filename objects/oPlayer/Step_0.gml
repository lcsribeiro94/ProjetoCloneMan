/// @description Aqui é controlado o comportamento do jogador.

key_up = keyboard_check(vk_up);
key_down = keyboard_check(vk_down);
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_jump = keyboard_check_pressed(vk_space);
key_dash = keyboard_check_pressed(vk_lshift);
key_dash_hold = keyboard_check(vk_lshift);
key_attack = keyboard_check_pressed(ord("Z"));
key_special = keyboard_check_pressed(ord("X"));
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
}

