/// @description AD movement with gravity
// You can write your code in this editor

hMove=0;
vMove=0;


jumpReady=false;

playerGravity = 0.2;
/*
//immpelemtation 1: player accelerates rather than moving at fixed speed
spdCap=3;
pAcceleration=1.5;
*/
//implementation 2: player moves at fixed speed
moveSpd = 5;
jumpSpeed=5;
charges=1;
permeateH=false;
permeateV=false;
//alarm[0]=room_speed*5;