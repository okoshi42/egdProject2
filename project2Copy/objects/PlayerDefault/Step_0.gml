/// @description AD movement with gravity and one jump
//left right movement input
//show_debug_message("slimeJump:");
//show_debug_message(slimeJump);
jumpReady = (place_meeting(x, y+1,Wall));//jump ready is becomes true when the player is on the ground
var kLeft=keyboard_check(ord("A"));
var kRight=keyboard_check(ord("D"));
var kJump=keyboard_check_pressed(vk_space);
show_debug_message(jumpReady);
switch(state){
	//when the player is not swinging
case pState.normal:
{
	hMove=(kRight-kLeft)*moveSpd;
	if(hMove!=0){
		HMS=sign(hMove);
		idleSprite=false;
		moveImgIndx++;
		if(moveImgIndx>=35)moveImgIndx=35;
	}
	else{
		if(!jumpReady)idleSprite=true;
		
		moveImgIndx--;
		if(moveImgIndx<=0){ 
		moveImgIndx=0;
		idleSprite=true;
		}
	}
	//hMove+=(kRight-kLeft)*pAcceleration;
	//hMove = clamp(hMove,-spdCap,spdCap);
	vMove+=playerGravity;
	//checks if the player hits space while on the ground, 
	//or if the player jumped out of the previous form
	if(((kJump) && (jumpReady))||(jumpSpawn))
	{
		//executes jump
		//if(hMove!=0){
		//slimeMJump=true
		//}
		//else{
		//slimeVJump=true;
		//}
		jumpImgIndx=12;
		slimeJump=true;
		if(jumpSpawn)jumpImgIndx=12;
		jumpSpawn=false;
	    //jumpReady=false;
		//vMove=-jumpSpeed;
	}
	if(slimeJump){
		jumpImgIndx++;
		//show_debug_message(jumpImgIndx);
		if(jumpImgIndx==13){
		jumpReady=false;
		vMove=-jumpSpeed;
		}

		if(!jumpReady&&jumpImgIndx>=63){
		jumpImgIndx=63;
		}
		if(jumpImgIndx<64){
		if(jumpImgIndx>13&&jumpReady)jumpImgIndx=64;}
		if(jumpImgIndx>=71){
			jumpImgIndx=0;
			slimeJump=false;
		}
	}
	/*
	if(slimeVJump){
		jumpImgIndx++;
		show_debug_message(jumpImgIndx);
		if(jumpImgIndx==13){
		jumpReady=false;
		vMove=-jumpSpeed;
		}
		
		if(jumpImgIndx>=71){
			jumpImgIndx=0;
			slimeVJump=false;
		}
	}
	
	else if(slimeMJump){
		jumpImgIndx++;
		show_debug_message(jumpImgIndx);
		if(jumpImgIndx==13){
		jumpReady=false;
		vMove=-jumpSpeed;
		}
	if(jumpImgIndx>=71){
		jumpImgIndx=0;
		slimeMJump=false;
		}
	}
	*/
	//swing calculations
	if(activateSwing==true)
	{
		swingPlayerX=x;
		swingPlayerY=y;
		AngularVelocity=speed;
		swingAngle=point_direction(anchorX,anchorY,x,y);
		swingLength=point_distance(anchorX,anchorY,x,y);
		state=pState.swing;
		swingInit=true;
	}
} break;

//when the player is swinging
case pState.swing:
{	//more swing calculations

	var swingAngleAcceleration= -0.2 * dcos(swingAngle);
	swingAngleAcceleration += (kRight-kLeft) *.06;
	AngularVelocity += swingAngleAcceleration;
	//implementation:manually control swing length with W and S
	var kUp=keyboard_check(ord("W"));
	var kDown=keyboard_check(ord("S"));
	lengthShift=(kDown-kUp)*4;
	
	//reels in swing upon activation
	if(swingInit)
	{
		if(swingLength>130)	swingLength=Approach(swingLength,130,5);
		else 
		{
			swingInit=false;
		}
	}
	else{
		drawFire=false;
		drawStatic=true;
		//change value here to adjust maximum rope length
	if(swingLength>=200&&lengthShift>0){
		lengthShift=0;	
	}
	}
		//stops length adjustment while touching walls
	if(place_meeting(x+lengthShift,y+lengthShift,Wall)){
	lengthShift=0;
	}
	swingLength+=lengthShift;
	swingLength=max(swingLength,50);//sets minimum length
	swingAngle+=AngularVelocity;
	//controls swing animation
	swingAngleM=abs(swingAngle%360);
	//show_debug_message(swingAngleM);
	if(swingAngleM>=105&&swingAngleM<190){imgIndx=0;}
	else if(swingAngleM>=190&&swingAngleM<222){imgIndx=1;}
	else if(swingAngleM>=222&&swingAngleM<254){imgIndx=2;}
	else if(swingAngleM>=254&&swingAngleM<286){imgIndx=3;}
	else if(swingAngleM>=286&&swingAngleM<318){imgIndx=4;}
	else if(swingAngleM>=318&&swingAngleM<350){imgIndx=5;}
	else if(swingAngleM>=350&&swingAngleM<360||swingAngleM<75){imgIndx=6;}
	else if(swingAngleM>=75&&swingAngleM<81){imgIndx=5;}
	else if(swingAngleM>=81&&swingAngleM<87){imgIndx=4;}
	else if(swingAngleM>=87&&swingAngleM<93){imgIndx=3;}
	else if(swingAngleM>=93&&swingAngleM<99){imgIndx=2;}
	else if(swingAngleM>=99&&swingAngleM<105){imgIndx=1;}

	AngularVelocity*=.99;//causes momentum decay
	//more calculations...
	swingPlayerX = anchorX + lengthdir_x(swingLength, swingAngle);
	swingPlayerY = anchorY + lengthdir_y(swingLength, swingAngle);
	//executes movements
	hMove=swingPlayerX-x;
	vMove=swingPlayerY-y;
	drawSwing=true;
	//checks for player jump, deactivates swing
	if(kJump)
	{	
		activateSwing=false;
		drawSwing=false;
		drawFire=false;
		drawStatic=false;
		imgIndx=0;
		instance_destroy(SwingAnchor);
		state=pState.normal;
		fireReady=true;
		groundedDuration=120;
	}
	//if player is on ground for 120 frames, deactivates swing
	if(place_meeting(x,y+1,Wall)){
		groundedDuration--;
		if(groundedDuration<=0){
		activateSwing=false;
		drawSwing=false;
		instance_destroy(SwingAnchor);
		state=pState.normal;
		fireReady=true;
		groundedDuration=120;
		}
	}
	else groundedDuration = 120;
}break;
}
//fires swing projectile
fire=mouse_check_button(mb_left);
if(fire){
	if(fireReady==true){
	
instance_create_layer(PlayerDefault.x,PlayerDefault.y, "Spawns", SwingAnchor);
	
		drawFire=true;
	fireReady=false;
	}
}
//player wall detection
if(place_meeting(x+hMove, y, Wall)){
var hStp = sign(hMove);
hMove=0;
while(!place_meeting(x+hStp, y, Wall)){x+=hStp;}
if(state==pState.swing){
swingAngle=point_direction(anchorX,anchorY,x,y);
AngularVelocity = 0;

}
}
x+=hMove;

if(place_meeting(x, y+vMove, Wall)){
var vStp = sign(vMove);
vMove=0;
while(!place_meeting(x, y+vStp, Wall) ){y+=vStp;}
if(state==pState.swing){
swingAngle=point_direction(anchorX,anchorY,x,y);
AngularVelocity = 0;
}
}

y+=vMove;
if(place_meeting(x,y,Hazard))
{
	moveSpd=2;
	jumpSpeed=2;
	//show_debug_message(PlayerManager.playerHealth);
PlayerManager.playerHealth-=Hazard.dmgPerSecond;
if(PlayerManager.playerHealth<=0) {
	PlayerManager.isDead=true;}
}
else
{
	moveSpd=5;
	jumpSpeed=5;
}
/*
if(place_meeting(x,y,Hazard))
{
	moveSpd=2;
	jumpSpeed=2;
	Health1.hit = true;
}
else
{
	moveSpd=5;
	jumpSpeed=5;
}*/