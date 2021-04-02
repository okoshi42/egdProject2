/// @description Insert description here
// You can write your code in this editor
if(PossessingForm){
	spawnX=PlayerMaster.x;
	spawnY=PlayerMaster.y;
	instance_destroy(PlayerMaster);
	instance_create_layer(spawnX,spawnY-32,"Instances",PlayerDefault);
	PlayerDefault.jumpSpawn=true;
	PossessingForm=false;
	isDead=false;
	playerHealth=100;
}