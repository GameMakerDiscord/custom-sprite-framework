///image_group_destroy(group)
if( ds_map_exists( global.m_ex_image , argument0 ) ){
    var _l = global.m_ex_image[? argument0 ];
    var _l_image = _l[| 0 ];
    var _l_background = _l[| 1 ];
    
    // If the stream is active, clear it
    if( ds_list_size( _l ) == 3 ){
        var _m_stream = _l[| 2 ];
        ds_list_destroy( _m_stream[? "loading" ] );
        ds_list_destroy( _m_stream[? "loading_3d" ] );
        var _p_sprite = _m_stream[? "sprite" ];
        while( ds_priority_size( _p_sprite ) > 0 ){
            var _l = ds_priority_delete_max( _p_sprite );
            sprite_delete( _l[| 0 ] );
            ds_list_destroy( _l );
        }
        ds_priority_destroy( _p_sprite );
        
        var _p_sprite_3d = _m_stream[? "sprite_3d" ];
        while( ds_priority_size( _p_sprite ) > 0 ){
            var _l = ds_priority_delete_max( _p_sprite_3d );
            sprite_delete( _l[| 0 ] );
            ds_list_destroy( _l );
        }
        ds_priority_destroy( _p_sprite_3d );
        
        ds_map_destroy( _m_stream );
    }
    
    // Clear the image info
    for( var n = 0; n < ds_list_size( _l_image ); n++ ){
        ds_grid_destroy( _l_image[| n ] );
    }
    
    // Clear the images
    for( var n = 0; n < ds_list_size( _l_background ); n++ ){
        background_delete( _l_background[| n ] );
    }
    // Remove the data structures
    ds_list_destroy( _l_image );
    ds_list_destroy( _l_background );
    ds_list_destroy( _l );
    ds_map_delete( global.m_ex_image , argument0 );
    return true;
} else {
    show_error( "The group '" + string( argument0 ) + "' you are trying to clear does not exist" , false );
    return false;
}
