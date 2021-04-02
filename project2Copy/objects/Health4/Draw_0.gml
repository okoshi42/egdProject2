/// @description Insert description here
// You can write your code in this editor
x = camera_get_view_x(view_camera[0]) + 60;
y = camera_get_view_y(view_camera[0]) + 20;

if(Health1.hp>=4)
{
draw_set_color(c_red);
draw_circle(x,y,5,false);
}