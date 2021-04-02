/// @description Insert description here
// You can write your code in this editor
/// @description Calculates Projectile Path
// You can write your code in this editor
//draws line between mouse position and spray bottle position
//calculates the trajectory in create in order to prevent the Crosshair position from updating and altering trajectory
//to adjust firing range, modify projectileSpeed and/or FrameLife
projectileSpeed=16;//speed per frame of projectile
FrameLife=25;//number of frames swingAnchor is in flight for
inFlight=true;
//angles the projectile along the line
dir=point_direction(x,y,mouse_x,mouse_y);
drawSplatter=false;
motion_set(dir,projectileSpeed);
