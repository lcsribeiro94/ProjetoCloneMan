/// @description Insert description here
// You can write your code in this editor
healthbar_width = 15;
healthbar_heigth = 60;
healthbar_x = window_get_width() - 100;
healthbar_y = 200;
hp = 60;
hsp = 0;
vsp = 0;
grv = 0.50;
dmg = 1;
if (global.hasDown) {
	dmg++;
	hp+= 10;
}
if (global.hasUp) {
	dmg++;
	hp+= 10;
}
if (global.hasNeutral) {
	dmg++;
	hp+= 10;
}

maxHP = hp;
inv_frameDuration = 0;
inv_frameAlpha = 0;

state = BOSSSTATES.FREE;

enum BOSSSTATES {
	FREE,
	ATTACKDEFAULT,
	ATTACKJUMP,
	ATTACKSLASH,
	ATTACKPOGO
}