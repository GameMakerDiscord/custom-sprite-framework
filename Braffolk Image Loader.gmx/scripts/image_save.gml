///image_save(ind,subimg,fname)
var _c_subimg = ( floor(argument1) mod argument0[# 1 , 0 ] ) * 3;

var _surf = surface_create( argument0[# 2 , 0 ] , argument0[# 3 , 0 ] );

surface_set_target( _surf );
    draw_clear_alpha( 0 , 0 );
    draw_background_part(
        argument0[# 6 + _c_subimg , 0 ] , 
        argument0[# 7 + _c_subimg , 0 ] ,
        argument0[# 8 + _c_subimg , 0 ] ,
        argument0[# 2 , 0 ] ,
        argument0[# 3 , 0 ] ,
        0 ,
        0
    );
surface_reset_target();
surface_save( _surf , argument2 );
surface_free( _surf );
