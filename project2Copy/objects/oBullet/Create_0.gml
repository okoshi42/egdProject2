/// @description Insert description here
// You can write your code in this editor
movespeed = 5;
cooldown = 30;
dir = point_direction(x,y,oAnchor.x,oAnchor.y);

motion_set(dir,movespeed);
image_angle = dir;

