/// @description Aqui são iniciadas os parametros de criação do jogador

hsp = 0;
hspWall = 8;
hspAcc = 4;
vsp = 0;
vspWall = -9;
grv = 0.5;
grvWall = 0;
walksp = 4;
dashsp = 10;

onWall = 0;
onGround = false;


spritePlayer = sPlayerIdle;
spritePlayerWalk = sPlayerWalk;
spritePlayerJump = sPlayerJump;
spritePlayerDash = sPlayerTemp;
spritePlayerWall = sPlayerWall;

state = PLAYERSTATE.FREE;

enum PLAYERSTATE {
	FREE,
	ATTACK1,
	ATTACK2,
	ATTACK3,
	LADDER,
	DASH
}