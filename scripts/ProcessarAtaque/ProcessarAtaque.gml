/// @function ProcessarAtaque(spriteAtaque, spriteHB, vsp);
/// @param {real} <sprite_index> The index of the sprite shown
/// @param {real} <sprite_index> The index of the sprite hb
/// @param {real} <vsp> The VSP for Bounce Attack (SpecialAirDown)

function ProcessarAtaque(){
	
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
			}
			// Checando se o inimigo já foi atingido neste frame
			var _hitID = _enemiesHitNow[| i];
			if (ds_list_find_index(enemiesHit, _hitID) == -1) {
				ds_list_add(enemiesHit, _hitID);
				with (_hitID) {
					// Definindo o que o ataque faz ao inimigo
					hp--;
				}
			}
		}
	}
	ds_list_destroy(_enemiesHitNow);
	mask_index = spritePlayer;
	
}