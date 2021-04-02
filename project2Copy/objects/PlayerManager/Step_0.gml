/// @description Insert description here
// You can write your code in this editor
/*
if(playerHp<=0)isDead=true;
if(hit)
{
	if(!invulState)
	{
		invulState = true;
		alarm[1] = room_speed;
		playerHp--;
		hit = false;
	}
	//prevents hit registration during Invulnerability frames
	else
	{
		hit = false;
	}
}
*/
if(isDead){
if(PossessingForm){
	
	spawnX=PlayerMaster.x;
	spawnY=PlayerMaster.y;
	instance_destroy(PlayerMaster);
	instance_create_layer(spawnX,spawnY-32,"Instances",PlayerDefault);
	PlayerDefault.jumpSpawn=true;
	PossessingForm=false;
	isDead=false;
	playerHealth=100;
	Hazard.dmgPerSecond=(1/60);
}
else
{
	instance_destroy(PlayerMaster);
	instance_destroy(SwingAnchor);
	alarm[0]=room_speed*3;
	isDead=false;
	Hazard.dmgPerSecond=(1/60);
}
}
