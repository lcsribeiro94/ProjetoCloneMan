/// @function ProcessarAtaque(spriteAtaque, spriteHB, vsp);
/// @param {real} <sprite_index> The index of the sprite shown
/// @param {real} <sprite_index> The index of the sprite hb
/// @param {real} <vsp> The VSP for Bounce Attack (SpecialAirDown)

function ProcessarAtaque(){
	var playerX = x;
	if (sprite_index != argument[0]) {
		sprite_index = argument[0];
		image_index = 0;
		ds_list_clear(enemiesHit);
	}
	
	// Atualizando hitbox e verificando inimigos atingidos
	mask_index = argument[1];
	var _enemiesHitNow = ds_list_create();
	var _hits = instance_place_list(x, y, oEnemy, _enemiesHitNow, false);
	if (_hits > 0) {
		for (var i = 0; i < _hits; i++) {
			if(argument_count > 2){
				vsp = argument[2];
				specialDownEnhancer = 0;
			}
			// Checando se o inimigo já foi atingido neste frame
			var _hitID = _enemiesHitNow[| i];
			if (ds_list_find_index(enemiesHit, _hitID) == -1) {
				ds_list_add(enemiesHit, _hitID);
				with (_hitID) {
					// Definindo o que o ataque faz ao inimigo
					
					if(playerX > x){
						hsp = -3;
					}else{
						hsp = 3;
					}
					vsp = -5;
					inv_frameDuration = 15;
					state = ENEMYSTATE.TAKEHIT;
					
					hp--;
				}
			}
		}
	}
	
	var _enemiesHitNowBoss = ds_list_create();
	var _hitsBoss = instance_place_list(x, y, oBoss, _enemiesHitNowBoss, false);
	if (_hitsBoss > 0) {
		for (var i = 0; i < _hitsBoss; i++) {
			if(argument_count > 2){
				vsp = argument[2];
				specialDownEnhancer = 0;
			}
			// Checando se o inimigo já foi atingido neste frame
			var _hitIDBoss = _enemiesHitNowBoss[| i];
			if (ds_list_find_index(enemiesHit, _hitIDBoss) == -1) {
				ds_list_add(enemiesHit, _hitIDBoss);
				with (_hitIDBoss) {
					// Definindo o que o ataque faz ao inimigo
					inv_frameDuration = 10;
					hp--;
				}
			}
		}
	}
	ds_list_destroy(_enemiesHitNow);
	ds_list_destroy(_enemiesHitNowBoss);
	mask_index = spritePlayer;
	
}