/// @description Insert description here
// You can write your code in this editor
//draws swing

if(drawFire) {
	draw_sprite_ext(SwingSprite,image_index,x,y,(point_distance(x,y,SwingAnchor.x,SwingAnchor.y)/64),.5,point_direction(x,y,SwingAnchor.x,SwingAnchor.y),c_white,image_alpha);
}
if(drawStatic){	
draw_sprite_ext(SwingActiveSprites,imgIndx,x,y,(swingLength/64),.5,point_direction(x,y,SwingAnchor.x,SwingAnchor.y),c_white,image_alpha);
draw_sprite_ext(slimeSide,image_index,x,y,sign(hMove),image_yscale,swingAngle+90,c_white,image_alpha);
}
else if(idleSprite&&!slimeJump)draw_self();
else if(!idleSprite&&!slimeJump) draw_sprite_ext(slimeMove,moveImgIndx,x,y,HMS,image_yscale,image_angle,c_white,image_alpha);
else if(slimeJump&&!idleSprite){
	//if(jumpImgIndx<13)draw_sprite_ext(vJumpPhase1,jumpImgIndx,x,y,HMS,image_yscale,image_angle,c_white,image_alpha);
    if((jumpImgIndx>=13&&jumpImgIndx<30))draw_sprite_ext(mJumpPhase2,image_index,x,y,HMS,image_yscale,image_angle,c_white,image_alpha);
	else if((jumpImgIndx>=30&&jumpImgIndx<32))draw_sprite_ext(mJumpPhase3,image_index,x,y,HMS,image_yscale,image_angle,c_white,image_alpha);
	else if((jumpImgIndx>=32&&jumpImgIndx<34))draw_sprite_ext(mJumpPhase4,image_index,x,y,HMS,image_yscale,image_angle,c_white,image_alpha);
	else if((jumpImgIndx>=34&&jumpImgIndx<38))draw_sprite_ext(mJumpPhase5,image_index,x,y,HMS,image_yscale,image_angle,c_white,image_alpha);
	else if((jumpImgIndx>=38&&jumpImgIndx<40))draw_sprite_ext(mJumpPhase6,image_index,x,y,HMS,image_yscale,image_angle,c_white,image_alpha);
	else if((jumpImgIndx>=40&&jumpImgIndx<42))draw_sprite_ext(mJumpPhase7,image_index,x,y,HMS,image_yscale,image_angle,c_white,image_alpha);
	else if((jumpImgIndx>=42&&jumpImgIndx<44))draw_sprite_ext(mJumpPhase8,image_index,x,y,HMS,image_yscale,image_angle,c_white,image_alpha);
	else if((jumpImgIndx>=44&&jumpImgIndx<46))draw_sprite_ext(mJumpPhase9,image_index,x,y,HMS,image_yscale,image_angle,c_white,image_alpha);
	else if((jumpImgIndx>=46&&jumpImgIndx<64))draw_sprite_ext(mJumpPhase91,image_index,x,y,HMS,image_yscale,image_angle,c_white,image_alpha);
	else draw_sprite_ext(mJumpPhase92,jumpImgIndx,x,y,HMS,image_yscale,image_angle,c_white,image_alpha);
}
else if(slimeJump&&idleSprite){
	//if(jumpImgIndx<13) draw_sprite_ext(vJumpPhase1,jumpImgIndx,x,y,1,image_yscale,image_angle,c_white,image_alpha);
	if((jumpImgIndx>=13&&jumpImgIndx<25)||(jumpImgIndx>=51&&jumpImgIndx<64)) draw_sprite_ext(vJumpPhase2,image_index,x,y,1,image_yscale,image_angle,c_white,image_alpha);
	else if((jumpImgIndx>=25&&jumpImgIndx<33)||(jumpImgIndx>=43&&jumpImgIndx<51)) draw_sprite_ext(vJumpPhase3,image_index,x,y,1,image_yscale,image_angle,c_white,image_alpha);
	else if(jumpImgIndx>=33&&jumpImgIndx<43) draw_sprite_ext(vJumpPhase4,image_index,x,y,1,image_yscale,image_angle,c_white,image_alpha);
	else draw_sprite_ext(vJumpPhase5,jumpImgIndx,x,y,1,image_yscale,image_angle,c_white,image_alpha);

}