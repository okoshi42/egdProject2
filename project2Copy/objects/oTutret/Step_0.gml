/// @description Insert description here
// You can write your code in this editor
if(fire)
{
	fire = false;
	alarm[0] = cooldown;
	instance_create_layer(x,y,"Instances",oBullet);
	oBullet.alarm[0] = shootTime;
}
