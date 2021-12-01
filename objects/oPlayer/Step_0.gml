/// @description Aqui é controlado o comportamento do jogador.

//healthbar_x = camera_get_view_x(view_camera[0]) + 10;
//healthbar_y = camera_get_view_y(view_camera[0]) + 150;

key_up = keyboard_check(vk_up) || keyboard_check(ord("W")) || gamepad_button_check(0, gp_padu) || gamepad_axis_value(0, gp_axislv) < -0.5;
key_down = keyboard_check(vk_down) || keyboard_check(ord("S")) || gamepad_button_check(0, gp_padd) || gamepad_axis_value(0, gp_axislv) > 0.5;
key_left = keyboard_check(vk_left) || keyboard_check(ord("A")) || gamepad_button_check(0, gp_padl) || gamepad_axis_value(0, gp_axislh) < -0.5;
key_right = keyboard_check(vk_right) || keyboard_check(ord("D")) || gamepad_button_check(0, gp_padr) || gamepad_axis_value(0, gp_axislh) > 0.5;
key_jump = keyboard_check_pressed(vk_space) || keyboard_check_pressed(ord("H")) || gamepad_button_check_pressed(0, gp_face1);
key_dash = keyboard_check_pressed(vk_lshift) || keyboard_check_pressed(ord("J")) || gamepad_button_check_pressed(0, gp_face2) || gamepad_button_check_pressed(0, gp_shoulderr) || gamepad_button_check_pressed(0, gp_shoulderrb);
key_dash_hold = keyboard_check(vk_lshift) || keyboard_check(ord("J")) || gamepad_button_check(0, gp_face2) || gamepad_button_check(0, gp_shoulderr) || gamepad_button_check(0, gp_shoulderrb);
key_attack = keyboard_check_pressed(ord("Z")) || keyboard_check_pressed(ord("Y")) || gamepad_button_check_pressed(0, gp_face3);
key_special = keyboard_check_pressed(ord("X")) || keyboard_check_pressed(ord("U")) || gamepad_button_check_pressed(0, gp_face4);
key_debug = keyboard_check_pressed(ord("P"));
if(key_debug){
	state = PLAYERSTATE.FREE;
	x = global.checkpoint_x;
	y = global.checkpoint_y;
}
if(hp != old_hp){
	if(hp < old_hp){
		if(hp > 0){
			hsp = -sign(image_xscale) * 3;
			vsp = -3;
			inv_frame = true;
			inv_frameDuration = 60;
			state = PLAYERSTATE.TAKEHIT;
		}else{
			vidaExtra--;
			if (vidaExtra < 1) {
				room_goto(RoomGameOver);
			}
			state = PLAYERSTATE.FREE;
			x = global.checkpoint_x;
			y = global.checkpoint_y;
			hp = maxHP;
			old_hp = hp;
		}
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

