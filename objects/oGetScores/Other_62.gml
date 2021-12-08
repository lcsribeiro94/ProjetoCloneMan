/// @description Processo Get
if (ds_map_find_value(async_load, "id") == get) {
	if (ds_map_find_value(async_load, "status") == 0) {
		//Resposta válida
		var _resposta = ds_map_find_value(async_load, "result");
		var _respostaMap = json_decode(_resposta);
		var _lista = ds_map_find_value(_respostaMap, "default");
		
		var _scoreX = 250;
		var _scoreY = 200;
		
		for (var i = 0; i < ds_list_size(_lista); i++) {
			var _scoreMap = ds_list_find_value(_lista, i);
			
			with (instance_create_layer(_scoreX, _scoreY, "Instances", oScoreboard)) {
				bdId = ds_map_find_value(_scoreMap, "score_id");
				bdSessionTime = ds_map_find_value(_scoreMap, "score_session_time");
				bdStages = ds_map_find_value(_scoreMap, "score_stages");
				bdLives = ds_map_find_value(_scoreMap, "score_lives");
				bdEnd = ds_map_find_value(_scoreMap, "score_end");
			}
			
			_scoreY += 50;
			
			ds_map_destroy(_scoreMap);
		}
		ds_list_destroy(_lista);
		ds_map_destroy(_respostaMap);
		global.erro = "";
	}
	else{
		global.erro = "Não foi possível se conectar ao servidor.";
		var _scoreX = 250;
		var _scoreY = 200;
		with (instance_create_layer(_scoreX, _scoreY, "Instances", oScoreboard)) {
				bdSessionTime = global.session_time_end;
				bdStages = global.session_stage;
				bdLives = global.session_lives;
				bdEnd = global.session_end;
			}
	}
}