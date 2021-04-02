/// @description defualt AD movement with gravity
// You can write your code in this editor
jumpReady = (place_meeting(x, y+1,Wall));
var kLeft=keyboard_check(ord("A"));
var kRight=keyboard_check(ord("D"));
var kJump=keyboard_check_pressed(vk_space);

	hMove=(kRight-kLeft)*moveSpd;
	//hMove+=(kRight-kLeft)*pAcceleration;
	//hMove = clamp(hMove,-spdCap,spdCap);
	vMove+=playerGravity;
	if(kJump) && (jumpReady)
	{
		jumpReady=false;
		vMove=-jumpSpeed;
	}
	
if(place_meeting(x+hMove, y, Wall)){
	
	var hStp = sign(hMove);
	hMove=0;	
while(!place_meeting(x+hStp, y, Wall)){x+=hStp;}
	
}
x+=hMove;

if(place_meeting(x, y+vMove, Wall)){

	var vStp = sign(vMove);
	vMove=0;
while(!place_meeting(x, y+vStp, Wall)){y+=vStp;}

}
y+=vMove;
if(place_meeting(x,y,Hazard))
{	moveSpd=4;
	jumpSpeed=3
	show_debug_message(PlayerManager.playerHealth);
PlayerManager.playerHealth-=Hazard.dmgPerSecond;
if(PlayerManager.playerHealth<=0) {PlayerManager.isDead=true;}
}
else
{
	moveSpd=10;
	jumpSpeed=5;
}
if(spawnCounter<10){
	spawnCounter++;
	}
else spawnAnimation=false;