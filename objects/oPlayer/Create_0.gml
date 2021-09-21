/// @description Aqui são iniciadas os parametros de criação do jogador

hsp = 0;
vsp = 0;
grv = 0.5;
walksp = 4;

state = PLAYERSTATE.FREE;

enum PLAYERSTATE {
	FREE,
	ATTACK1,
	ATTACK2,
	ATTACK3,
	LADDER,
	AIR
}