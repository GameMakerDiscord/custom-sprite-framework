///draw_image_ext(image,subimg,x,y,xscale,yscale,rot,colour,alpha)
gml_pragma("forceinline"); // in YYC, proccessing boost

var _c_subimg = ( floor(argument1) mod argument0[# 1 , 0 ] ) * 3;
draw_background_general(
    argument0[# 6 + _c_subimg , 0 ] , 
    argument0[# 7 + _c_subimg , 0 ] ,
    argument0[# 8 + _c_subimg , 0 ] ,
    argument0[# 2 , 0 ] ,
    argument0[# 3 , 0 ] ,
    argument2 - lengthdir_x( argument0[# 4 , 0 ] , argument6 )*argument4 - lengthdir_x( argument0[# 5 , 0 ] , argument6 - 90 )*argument5 ,
    argument3 - lengthdir_y( argument0[# 4 , 0 ] , argument6 )*argument4 - lengthdir_y( argument0[# 5 , 0 ] , argument6 - 90 )*argument5 ,
    argument4 ,
    argument5 ,
    argument6 ,
    argument7 ,
    argument7 ,
    argument7 ,
    argument7 ,
    argument8
);
