/// @description Insert description here
// You can write your code in this editor
if(is_enabled){
	is_enabled = false;
	
	global.checkpoint_x = x;
	global.checkpoint_y = y;
		
	instance_create_depth(x, y, depth, oCheckpoint_Glow);
}
