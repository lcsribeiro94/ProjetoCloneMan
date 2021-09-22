/// @description Aqui são iniciadas os parametros de criação do jogador

hsp = 0;
hspWall = 8;
hspAcc = 4;
hspMax = 100;
vsp = 0;
vspWallJ = -9;
vspMax = 10;
grv = 0.5;
grvWall = 0.5;
dashsp = 15;
vspWall = 5;
dashDuration = 0;
dashCooldown = 0;
wallJumpDuration = 0;

onWall = 0;
onGround = false;
onDash = false;


spritePlayer = sPlayerIdle;
spritePlayerWalk = sPlayerWalk;
spritePlayerJump = sPlayerJump;
spritePlayerDash = sPlayerDash;
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