/// @description Insert description here
// You can write your code in this editor

target = other;
	
other.state = PLAYERSTATE.TAKEHIT;

target.x = global.checkpoint_x;
target.y = global.checkpoint_y;
target.state = PLAYERSTATE.FREE;
target.hp = target.maxHP;
target.old_hp = target.maxHP;