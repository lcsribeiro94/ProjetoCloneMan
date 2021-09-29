/// @description Aqui são iniciadas os parametros de criação do jogador

hsp = 0;
hspWall = 4;
hspAcc = 3;
hspMax = 35;
vsp = 0;
vspWallJ = -10;
vspMax = 9;
grv = 0.50;
grvWall = 0.50;
dashsp = 10;
vspWall = 3.5;
dashDuration = 0;
dashCooldown = 0;
dashAcc = 1.2;
dashActualSpeed = 0;
dashJump = false;
wallJumpDuration = 0;
nextAtk = false;
atkCooldown = 0;
dashHoldMultiplier = 2.5;

onWall = 0;
onGround = false;
onDash = false;

enemiesHit = ds_list_create();

spritePlayer = sPlayerIdle;
spritePlayerWalk = sPlayerWalk;
spritePlayerJump = sPlayerJump;
spritePlayerDash = sPlayerDash;
spritePlayerWall = sPlayerWall;
spritePlayerAttack1 = sPlayerAttack1;
spritePlayerAttack2 = sPlayerAttack2;
spritePlayerAttack3 = sPlayerAttack3;
spritePlayerAttackAir = sPlayerAttackAir;

state = PLAYERSTATE.FREE;

enum PLAYERSTATE {
	FREE,
	ATTACK1,
	ATTACK2,
	ATTACK3,
	ATTACKAIR,
	LADDER
}