/// @description Insert description here
// You can write your code in this editor
timer--;
if(timer <= 0){
	var plat = instance_create_depth(x, y, depth, oWall);
	plat.wallPop = true;
	plat.hsp = hsp;
	plat.image_index = 2;
	plat.timer = timerPlat;
	plat.timerPop = timerPop;
	plat.timerPlat = timerPlat;
	plat.image_xscale = image_xscale;
	instance_destroy();
}

if (place_meeting(x+hsp, y, oWallBounce)) {
	while (!place_meeting(x+sign(hsp), y, oWallBounce)) {
		x = x + sign(hsp);
	}
	hsp *= -1;
}
x = x + hsp;