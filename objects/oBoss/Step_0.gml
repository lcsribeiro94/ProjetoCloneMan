/// @description Insert description here
// You can write your code in this editor
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

if (hsp != 0) image_xscale = sign(hsp) * -1;

if (hp <= 0) instance_destroy();

if(place_meeting(x,y,oPlayer)){
	if(!oPlayer.inv_frame){
		oPlayer.hp -= 1;
		if(BOSSSTATES.ATTACKPOGO){
			vsp = random(3) - 6;
		}
	}
}

vsp = vsp + grv;

if (place_meeting(x+hsp, y, oWall)) {
	while (!place_meeting(x+sign(hsp), y, oWall)) {
		x = x + sign(hsp);
	}
	hsp *= -1;
}
x = x + hsp;
hspCarry = 0;

// V Collision
if (place_meeting(x, y+vsp, oWall)) {
	while (!place_meeting(x, y+sign(vsp), oWall)) {
		y = y + sign(vsp);
	}
	vsp = 0;
}
y = y + vsp;

switch(state){
	case BOSSSTATES.FREE:
		if (sprite_index != sBossIdle) {
			sprite_index = sBossIdle;
			image_index = 0;
			hsp = 0;
			grv = 0.50;
		}
		var attack = random(100);
		if(attack <= 5){
			var chooseAtk = round(random(5));
			switch(chooseAtk){
				case 1:
					if(global.lastRoom == 2 || global.hasUp){
						state = BOSSSTATES.ATTACKJUMP;
					}else{
						state = BOSSSTATES.ATTACKDEFAULT;
					}
					break;
				case 2:
					if(global.lastRoom == 1 || global.hasNeutral){
						state = BOSSSTATES.ATTACKSLASH;
					}else{
						state = BOSSSTATES.ATTACKDEFAULT;
					}
					break;
				case 3:
					if(global.lastRoom == 0 || global.hasDown){
						state = BOSSSTATES.ATTACKPOGO;
					}else{
						state = BOSSSTATES.ATTACKDEFAULT;
					}
					break;
				default:
					state = BOSSSTATES.ATTACKDEFAULT;
					break;
			}
		}
		break;
	case BOSSSTATES.ATTACKDEFAULT:
		if (sprite_index != sBossAttackDefault) {
			sprite_index = sBossAttackDefault;
			image_index = 0;
		}
		
		break;
	case BOSSSTATES.ATTACKJUMP:
		if (sprite_index != sBossAttackJump) {
			sprite_index = sBossAttackJump;
			image_index = 0;
			hsp = image_xscale * -7.5;
			
			vsp = random(5) - 7.5;
			grv = 0.2;
		}
		if(vsp == 0){
			state = BOSSSTATES.FREE;
		}
		break;
	case BOSSSTATES.ATTACKSLASH:
		if (sprite_index != sBossAttackSlash) {
			var inst = instance_create_layer(x, y, "Instances", oAttackProjectileBoss);
			inst.sprite_index = sBossSpecialNeutral;
			inst.image_xscale = image_xscale * -1;
			inst.orientation = image_xscale * -1;
			sprite_index = sBossAttackSlash;
			image_index = 0;
		}
		break;
	case BOSSSTATES.ATTACKPOGO:
		if (sprite_index != sBossAttackPogo) {
			sprite_index = sBossAttackPogo;
			image_index = 0;
			hsp = image_xscale * -1 * (round(random(2)) + 1);
			
			vsp = random(3) - 6;
			grv = 0.1;
		}
		if(vsp == 0){
			state = BOSSSTATES.FREE;
		}
		break;
}

if(animation_end() && state != BOSSSTATES.ATTACKPOGO){
	state = BOSSSTATES.FREE;
}