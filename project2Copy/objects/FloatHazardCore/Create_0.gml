/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor
guidance_array=array_create(6);
guidance_array[0]=guide0;
guidance_array[1]=guide1;
guidance_array[2]=guide2;
guidance_array[3]=guide3;
guidance_array[4]=guide4;
guidance_array[5]=guide5;
/*guidance_array[6]=guide6;
guidance_array[7]=guide7;
guidance_array[8]=guide8;
guidance_array[9]=guide9;
guidance_array[10]=guide10;
guidance_array[11]=guide11;
guidance_array[12]=guide12;
guidance_array[13]=guide13;
guidance_array[14]=guide14;
guidance_array[15]=guide15;
guidance_array[16]=guide16;
guidance_array[17]=guide17;
guidance_array[18]=guide18;
guidance_array[19]=guide19;
guidance_array[20]=guide20;
guidance_array[21]=guide21;
guidance_array[22]=guide22;
guidance_array[23]=guide23;
*/
currentSide=0;
hMove=0;
vMove=0;

FloatInstance=instance_create_layer(x,y,"Spawns",FloatHazard);	
FloatInstance.parent=id;
if(id==Core1){
currentSide=0;
}
else if(id==Core2){
currentSide=4;
}