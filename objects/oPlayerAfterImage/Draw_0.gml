/// @description Insert description here
// You can write your code in this editor
alpha = alpha - 0.033;

image_alpha = alpha;
if(alpha <= 0){
	instance_destroy();
}
draw_self();