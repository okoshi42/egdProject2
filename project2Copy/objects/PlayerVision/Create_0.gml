/// @description template movement variables
//default movement template
spawnAnimation=true;
spawnCounter=0;
idleCount=0;
hMove=0;
vMove=0;
jumpReady=false;
playerGravity = 0.2;
moveSpd = 5;
jumpSpeed=5;
view_set_visible(1,true);
view_set_visible(0,false);
exitState=false;
	camWid=800;
	camHt=500;
	originX=max(x-(camWid/2),0);
	originY=max(y-(camHt/2),0);
	originX=min(originX,(3200-camWid));
	originY=min(originY,(2016-camHt));
	cameraPosX=originX
	cameraPosY=originY
camera_set_view_pos(view_camera[1],cameraPosX,cameraPosY);