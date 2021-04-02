/// @description Insert description here
// You can write your code in this editor

if(!permeateH)&&(!permeateV){
	if(charges<=0&&charges>0){
instance_create_layer(x,y,"Instances",PlayerDefault);
instance_destroy();
}

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
}
if(place_meeting(x+hMove, y, DefaultWall)||place_meeting(x+hMove, y, PermeableFloor)){
	
	var hStp = sign(hMove);
	hMove=0;	
while(!place_meeting(x+hStp, y, DefaultWall)&&!place_meeting(x+hMove, y, PermeableFloor)){x+=hStp;}
	
}
if(place_meeting(x, y, PermeableWall)){
	if(!permeateH){charges--;}
	permeateH=true;
	vMove=0;
	var permeationMovement=sign(hMove);
	if(permeationMovement==0){
	//prevent the player from getting stuck if they stop perfectly next to a permeable wall
	permeateH=false;
	}
	hMove=permeationMovement;

}
else{permeateH=false;}

x+=hMove;

if(place_meeting(x, y+vMove, DefaultWall)){


	var vStp = sign(vMove);
	vMove=0;

while(!place_meeting(x, y+vStp, DefaultWall)){y+=vStp;}

}

if(place_meeting(x, y+vMove, PermeableFloor)){

	if(sign(vMove)<0){
	hMove=0;
	if(!permeateV) {charges--;}
	permeateV=true;
	vMove=-.5;
	}
if(!permeateV){
	vMove=0;
//	while(!place_meeting(x, y+vStp, PermeableFloor)){y+=vStp;}
		var kDown = keyboard_check_pressed(vk_shift);
	if(kDown){
		hMove=0;
		permeateV=true;
		charges--;
		vMove=.5;
	}
	}
}
else{permeateV=false;}
y+=vMove;
