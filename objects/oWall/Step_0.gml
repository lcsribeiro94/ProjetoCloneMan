/// @description Insert description here
// You can write your code in this editor
if (place_meeting(x+hsp, y, oWallBounce)) {
	while (!place_meeting(x+sign(hsp), y, oWallBounce)) {
		x = x + sign(hsp);
	}
	hsp *= -1;
}
x = x + hsp;

if(instance_exists(oPlayer)){
	if(place_meeting(x, y-1, oPlayer) || place_meeting(x - 1, y, oPlayer) || place_meeting(x + 1, y, oPlayer)){
		oPlayer.hspCarry = hsp;
	}
}
if(wallPop){
	timer--;
	if(timer <= 0){
		var plat = instance_create_depth(x, y, depth, oWallPop);
		plat.hsp = hsp;
		plat.timer = timerPop;
		plat.timerPlat = timerPlat;
		plat.timerPop = timerPop;
		plat.image_xscale = image_xscale;
		instance_destroy();
	}
}