///draw_image(image,subimg,x,y)
gml_pragma("forceinline"); // in YYC, proccessing boost

var _c_subimg = ( floor(argument1) mod argument0[# 1 , 0 ] ) * 3;
draw_background_part(
    argument0[# 6 + _c_subimg , 0 ] , 
    argument0[# 7 + _c_subimg , 0 ] ,
    argument0[# 8 + _c_subimg , 0 ] ,
    argument0[# 2 , 0 ] ,
    argument0[# 3 , 0 ] ,
    argument2 - argument0[# 4 , 0 ] ,
    argument3 - argument0[# 5 , 0 ]
);
