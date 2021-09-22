/// @description Aqui são iniciadas os parametros de criação do jogador

hsp = 0;
hspWall = 8;
hspAcc = 4;
hspMax = 100;
vsp = 0;
vspWall = -9;
vspMax = 10;
grv = 0.5;
grvWall = 0;
dashsp = 50;

onWall = 0;
onGround = false;
onDash = false;


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