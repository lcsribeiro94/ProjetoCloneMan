/// @description Insert description here
// You can write your code in this editor
if (keyboard_check(vk_enter) || gamepad_button_check_pressed(0, gp_start)) {
	room_goto(RoomTitle);
}