/// @description Insert description here
// You can write your code in this editor

rotacao = 90 - radtodeg(arctan(yDiff/xDiff));
timer--;
if(timer <= 20){
	instance_destroy();
}