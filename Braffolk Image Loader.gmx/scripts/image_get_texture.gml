///image_get_texture(sprite,subimg)
gml_pragma("forceinline"); 

var _c_subimg = ( floor(argument1) mod argument0[# 1 , 0 ] ) * 3;
return( background_get_texture( argument0[# 6 + _c_subimg , 0 ] ) );
