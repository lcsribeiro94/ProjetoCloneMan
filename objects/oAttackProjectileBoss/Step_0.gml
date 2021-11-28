/// @description Insert description here
// You can write your code in this editor
x = x + (hsp * orientation);
hsp = hsp * hspAcc;
if (place_meeting(x+hsp, y, oWall)) {
		while (!place_meeting(x+sign(hsp), y, oWall)) {
			x = x + sign(hsp);
		}
		instance_destroy();
	}
if(hsp > hspMax){
	hsp = hspMax;
}
if(place_meeting(x,y,oPlayer)){
	if(!oPlayer.inv_frame){
		oPlayer.hp -= 1;
	}
}
duration--;
var inst = instance_create_layer(x, y, "Instances", oAttackProjectileAfterImageBoss);
inst.sprite_index = sprite_index;
inst.image_index = image_index;
inst.image_xscale = image_xscale;
if(duration <= 0) instance_destroy();