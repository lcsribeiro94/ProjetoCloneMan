/// @description Insert description here
// You can write your code in this editor

draw_sprite_ext(sHealthBar_bg,0,healthbar_x,healthbar_y,2,2,0,c_white,1);
draw_sprite_stretched(sHealthBarSprite, 0, healthbar_x, healthbar_y + (2 * -healthbar_heigth * (hp/maxHP)), 2 * healthbar_width, 2 * (hp/maxHP) * healthbar_heigth);
draw_sprite_ext(sHealthBar_border,0,healthbar_x,healthbar_y,2,2,0,c_white,1);
draw_text(healthbar_x, healthbar_y + 50, (vidaExtra));