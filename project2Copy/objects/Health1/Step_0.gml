/// @description Insert description here
// You can write your code in this editor
if(hit)
{
	if(canTake)
	{
		canTake = false;
		alarm[0] = 60;
		hp --;
		hit = false;
	}
	//prevents hit registration during Invulnerability frames
	else
	{
		hit = false;
	}
}