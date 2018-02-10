///draw_image_tiled(image,subimg,x,y)
gml_pragma("forceinline"); // in YYC, proccessing boost

var _c_subimg = ( floor(argument1) mod argument0[# 1 , 0 ] ) * 3;

var _w = argument0[# 2 , 0 ];
var _h = argument0[# 3 , 0 ];
var _bck  = argument0[# 6 + _c_subimg , 0 ];
var _left = argument0[# 7 + _c_subimg , 0 ];
var _top  = argument0[# 8 + _c_subimg , 0 ];
var _xo = ( argument2 mod _w );
var _yo = ( argument3 mod _h );

for( var _x = -_w; _x <= view_wview[ view_current ]; _x += _w ){
    for( var _y = -_h; _y <= view_hview[ view_current ]; _y += _h ){
        draw_background_part(
            _bck , 
            _left ,
            _top ,
            _w ,
            _h ,
            _xo + _x ,
            _yo + _y
        );
    }
}
