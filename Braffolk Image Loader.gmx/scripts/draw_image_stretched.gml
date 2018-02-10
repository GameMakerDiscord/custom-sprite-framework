///draw_image_stretched(sprite,subimg,x,y,w,h)
gml_pragma("forceinline"); // in YYC, proccessing boost

var _c_subimg = ( floor(argument1) mod argument0[# 1 , 0 ] ) * 3;
draw_background_part_ext(
    argument0[# 6 + _c_subimg , 0 ] , 
    argument0[# 7 + _c_subimg , 0 ] ,
    argument0[# 8 + _c_subimg , 0 ] ,
    argument0[# 2 , 0 ] ,
    argument0[# 3 , 0 ] ,
    argument2 ,
    argument3 ,
    ( argument4 / argument0[# 2 , 0 ] ) ,
    ( argument5 / argument0[# 3 , 0 ] ) ,
    c_white ,
    1
);
