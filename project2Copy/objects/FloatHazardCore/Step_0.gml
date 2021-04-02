/// @description Insert description here
// You can write your code in this editor

hMove=Approach(x,guidance_array[currentSide].x,3);
vMove=Approach(y,guidance_array[currentSide].y,3);
var inst;
inst=instance_place(x,y,floatGuiders);
if(inst==guidance_array[currentSide])
{
currentSide++;

}
//show_debug_message(currentSide);
x=hMove;
y=vMove;
//currentSide= currentSide % (number of guiders for that instance) + (first guider of the instance)
if(id==Core1){
currentSide=currentSide%4;
}
else if(id==Core2){
currentSide= (currentSide%2) + 4;
}