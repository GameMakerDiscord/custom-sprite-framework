///image_save_strip(ind,fname)
var _subimg_count = argument0[# 1 , 0 ];

var _surf = surface_create( argument0[# 2 , 0 ] * _subimg_count , argument0[# 3 , 0 ] );
surface_set_target( _surf );
    draw_clear_alpha( 0 , 0 );
    for( var n = 0; n < _subimg_count; n++ ){
        draw_background_part(
            argument0[# 6 + n*3 , 0 ] , 
            argument0[# 7 + n*3 , 0 ] ,
            argument0[# 8 + n*3 , 0 ] ,
            argument0[# 2 , 0 ] ,
            argument0[# 3 , 0 ] ,
            argument0[# 2 , 0 ] * n ,
            0
        );
    }
surface_reset_target();

surface_save( _surf , argument1 );
surface_free( _surf );
