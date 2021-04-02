/// @description defualt AD movement with gravity
// You can write your code in this editor
if(!exitState){
if(camWid<800&&camHt<500){
camWid=Approach(camWid,800,16);
camHt=Approach(camHt,500,11.5);
originX=max(x-(camWid/2),0);
originY=max(y-(camHt/2),0);
originX=min(originX,(1600-camWid));
originY=min(originY,(1000-camHt));
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
		if(camWid>480&&camHt>270){
		camWid=Approach(camWid,480,64);
		camHt=Approach(camHt,270,46);
		//camera_set_view_size(view_camera[1],camWid,camHt);
		originX=max(x-(camWid/2),0);
		originY=max(y-(camHt/2),0);
		originX=min(originX,(1600-camWid));
		originY=min(originY,(1000-camHt));
		cameraPosX=originX;
		cameraPosY=originY;
		camera_set_view_pos(view_camera[1],cameraPosX,cameraPosY);
		}
		else{
		view_set_visible(0,true);
		view_set_visible(1,false);
		instance_create_layer(x,y-32,"Instances",PlayerDefaultDevMode);
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
	cameraPosX=max(cameraPosX,(originX-100),0);
	cameraPosY=max(cameraPosY,(originY-100),0);
	cameraPosX=min(cameraPosX,(originX+100),800);
	cameraPosY=min(cameraPosY,(originY+100),500);
	camera_set_view_pos(view_camera[1],cameraPosX,cameraPosY);
	camera_set_view_size(view_camera[1],camWid,camHt);