/// @description Aqui é controlado o comportamento do jogador.

key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_jump = keyboard_check_pressed(vk_space);

switch (state) {
	case PLAYERSTATE.FREE:
		PlayerState_Free();
		break;
}

