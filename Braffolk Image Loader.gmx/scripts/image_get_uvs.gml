///image_get_uvs(spr,subimg)
gml_pragma("forceinline");
var _c_subimg = ( floor(argument1) mod argument0[# 1 , 0 ] ) * 3;
var _bck = argument0[# 6 + _c_subimg , 0 ];

var _ar;
_ar[ 0 ] = argument0[# 7 + _c_subimg , 0 ] / background_get_width( _bck );
_ar[ 1 ] = argument0[# 8 + _c_subimg , 0 ] / background_get_width( _bck );
_ar[ 2 ] = (argument0[# 7 + _c_subimg , 0 ] + argument0[# 2 , 0 ]) / background_get_width( _bck );
_ar[ 3 ] = (argument0[# 8 + _c_subimg , 0 ] + argument0[# 3 , 0 ]) / background_get_width( _bck );
return( _ar );
