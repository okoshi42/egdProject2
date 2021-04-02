/// @description AD movement with gravity
// You can write your code in this editor

hMove=0;
moveImgIndx=0;
jumpImgIndx=0;
idleSprite=true;
slimeJump=false;
HMS=0;
vMove=0;


anchorX=0;
anchorY=0;
jumpReady=false;
fireReady=true;
activateSwing=false;
drawFire=false;
drawStatic=false;
imgIndx=0;

drawSwing=false;
playerGravity = 0.2;
jumpSpawn=false
groundedDuration=120;//sets duration player can be on ground before swing deactivates
/*
//immpelemtation 1: player accelerates rather than moving at fixed speed
spdCap=3;
pAcceleration=1.5;
*/
//implementation 2: player moves at fixed speed
moveSpd = 5;
jumpSpeed=5;
   enum pState{
	normal,
	swing
	
   };
  state=pState.normal;
  swingInit=false;
  PlayerManager.PossessingForm=false;