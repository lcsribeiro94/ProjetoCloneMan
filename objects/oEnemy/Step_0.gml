if (hp <= 0) instance_destroy();

if(inv_frameDuration == 0){
	image_alpha = 1;
}else{
	if(inv_frameDuration % 2 == 0)
	if(inv_frameAlpha == 0){
		inv_frameAlpha = 1;
	}else{
		inv_frameAlpha = 0;
	}
	image_alpha = inv_frameAlpha;
}
inv_frameDuration = max(inv_frameDuration - 1, 0);
if(state == ENEMYSTATE.TAKEHIT){
	EnemyState_takeHit();
}else{
	EnemyState_1();
}
if(place_meeting(x,y,oPlayer)){
	if(!oPlayer.inv_frame){
		oPlayer.hp -= 1;
	}
}