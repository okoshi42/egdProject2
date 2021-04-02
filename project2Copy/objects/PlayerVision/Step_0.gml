/// @description defualt AD movement with gravity
// You can write your code in this editor
if(!exitState){
if(camWid<1200&&camHt<750){
camWid=Approach(camWid,1200,16);
camHt=Approach(camHt,750,10);
originX=max(x-(camWid/2),0);
originY=max(y-(camHt/2),0);
originX=min(originX,(3200-camWid));
originY=min(originY,(2016-camHt));
cameraPosX=originX;
cameraPosY=originY;
camera_set_view_pos(view_camera[1],cameraPosX,cameraPosY);
}}
var kLeft=keyboard_check(ord("A"));
var kRight=keyboard_check(ord("D"));
var kUp=keyboard_check(ord("W"));
var kDown=keyboard_check(ord("S"));
var kJump=keyboard_check_pressed(vk_space);
	if((kJump)||(exitState)) 
	{
		exitState=true;
		if(camWid>800&&camHt>500){
		camWid=Approach(camWid,800,64);
		camHt=Approach(camHt,500,40);
		//camera_set_view_size(view_camera[1],camWid,camHt);
		originX=max(x-(camWid/2),0);
		originY=max(y-(camHt/2),0);
		originX=min(originX,(3200-camWid));
		originY=min(originY,(2016-camHt));
		cameraPosX=originX;
		cameraPosY=originY;
		camera_set_view_pos(view_camera[1],cameraPosX,cameraPosY);
		}
		else{
		view_set_visible(0,true);
		view_set_visible(1,false);
		instance_create_layer(x,y-32,"Instances",PlayerDefault);
		PlayerDefault.jumpSpawn=true;
		exitState=false;
		instance_destroy();
		}
	}

	hMove=(kRight-kLeft)*moveSpd;
	vMove=(kDown-kUp)*moveSpd;
	cameraPosX+=hMove;
	cameraPosY+=vMove;
	if(!kRight)&&(!kLeft)&&!(kUp)&&(!kDown){
	cameraPosX=Approach(cameraPosX,originX,1);
	cameraPosY=Approach(cameraPosY,originY,1);
	}
	cameraPosX=max(cameraPosX,(originX-200),0);
	cameraPosY=max(cameraPosY,(originY-200),0);
	cameraPosX=min(cameraPosX,(originX+200),3200);
	cameraPosY=min(cameraPosY,(originY+200),2016);
	camera_set_view_pos(view_camera[1],cameraPosX,cameraPosY);
	camera_set_view_size(view_camera[1],camWid,camHt);
	if(spawnCounter<22){
	spawnCounter++;
	}
	else spawnAnimation=false;