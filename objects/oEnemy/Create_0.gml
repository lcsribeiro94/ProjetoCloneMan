/// @description 

hp = 3;
old_hp = 3;
hsp = 3;
vsp = 0;
grv = 1;
state = ENEMYSTATE.FREE;
hspCarry = 0;
inv_frameDuration = 0;
inv_frameAlpha = 0;

enum ENEMYSTATE {
	FREE,
	TAKEHIT
}