/// @description 

if (hp <= 0) instance_destroy();

if (place_meeting(x+hsp, y, oWall)) {
	while (!place_meeting(x+sign(hsp), y, oWall)) {
		x = x + sign(hsp);
	}
	hsp *= -1;
}
if (!place_meeting(x+(hsp), y+sprite_height, oWall)) {
	while (place_meeting(x+sign(hsp), y+sprite_height, oWall)) {
		x = x + sign(hsp);
	}
	hsp *= -1;
}

x = x + hsp;

if(place_meeting(x,y,oPlayer)){
	if(!oPlayer.inv_frame){
		oPlayer.hp -= 1;
	}
}