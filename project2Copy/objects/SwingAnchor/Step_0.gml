/// @description Insert description here
// You can write your code in this editor
if(inFlight){
FrameLife--;
PlayerDefault.imgIndx++;
if(FrameLife<=0){
instance_destroy();
PlayerDefault.drawFire=false;
PlayerDefault.imgIndx=0;
PlayerDefault.fireReady=true;
}
}
if(place_meeting(x,y,Wall))
{
	if(place_meeting(x,y,DefaultWall)){
	FrameLife=0;
	}
	else{
	drawSplatter=true;
	inFlight=false;
	PlayerDefault.anchorX=x;
	PlayerDefault.anchorY=y;
	PlayerDefault.activateSwing=true;
	speed=0;
	}
}