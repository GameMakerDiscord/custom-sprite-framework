///image_cache_create( group )
/*
    Creates a cache for the image group and returns the buffer that it is stored in,
    this can be saved using image_cache_save() or used in networking.
    
    -------------------------
        group - The group name or the name that image_group_create() returned.
    -------------------------
    
    RETURNS buffer or -1 if failed.
*/

if( ds_map_exists( global.m_ex_image , argument0 ) ){
    var _l = global.m_ex_image[? argument0 ];
    var _l_image      = _l[| 0 ];
    var _l_background = _l[| 1 ];
    
    // Temp directory
    var _dir = working_directory + ".TEMP_IMAGE_FOLDER/";
    if( directory_exists( _dir ) ){
        directory_destroy( _dir );
    }
    directory_create( _dir );
    
    // Create the cache and add safe checks
    var _buf_cache = buffer_create( 1 , buffer_grow , 1 );
    buffer_seek( _buf_cache , buffer_seek_start , 0 );
    buffer_write( _buf_cache , buffer_string , "IMAGE_CACHE" );
    buffer_write( _buf_cache , buffer_string , global.ex_image_cache_version );
    
    // Add the image to the cache
    buffer_write( _buf_cache , buffer_u16 , ds_list_size( _l_background ) );
    for( var n = 0; n < ds_list_size( _l_background ); n++ ){
        var _back = _l_background[| n ];
        background_save( _l_background[| n ] , _dir + string( _l_background[| n ] ) + ".png" );
        var _buf = buffer_load( _dir + string( _l_background[| n ] ) + ".png" );
        buffer_write( _buf_cache , buffer_u32 , buffer_get_size( _buf ) );
        buffer_copy( _buf , 0 , buffer_get_size( _buf ) , _buf_cache , buffer_tell( _buf_cache ) );
        
        buffer_seek( _buf_cache , buffer_seek_relative , buffer_get_size( _buf ) );
        buffer_delete( _buf );
    }
    
    // Write the image info into the cache
    buffer_write( _buf_cache , buffer_u16 , ds_list_size( _l_image ) );
    for( var n = 0; n < ds_list_size( _l_image ); n++ ){
        var _g       = _l_image[| n ];
        var _id      = _g[# 0 , 0 ];
        var _subimg  = _g[# 1 , 0 ];
        var _width   = _g[# 2 , 0 ];
        var _height  = _g[# 3 , 0 ];
        var _xorigin = _g[# 4 , 0 ];
        var _yorigin = _g[# 5 , 0 ];
        
        buffer_write( _buf_cache , buffer_string , string( _id )  );
        buffer_write( _buf_cache , buffer_u16 , _subimg  );
        buffer_write( _buf_cache , buffer_u16 , _width   );
        buffer_write( _buf_cache , buffer_u16 , _height  );
        buffer_write( _buf_cache , buffer_s16 , _xorigin );
        buffer_write( _buf_cache , buffer_s16 , _yorigin );
        
        for( var i = 0; i < _subimg; i++ ){
            var _index = ds_list_find_index( _l_background , _g[# 6 + i * 3 , 0 ] );
            if( _index != -1 )
                buffer_write( _buf_cache , buffer_u16 , _index );//_g[# 6 + i * 3 , 0 ] );
            else
                show_error( "The texturepage with id '" + string( _g[# 6 + i * 3 , 0 ] ) + "' Couldn't be found in the group background ds_list" , true );
            buffer_write( _buf_cache , buffer_u16 , _g[# 7 + i * 3 , 0 ] );
            buffer_write( _buf_cache , buffer_u16 , _g[# 8 + i * 3 , 0 ] );
        }
        buffer_write( _buf_cache , buffer_string , string( _g[# ds_grid_width( _g ) - 1 , 0 ] ) );
    }
    buffer_resize( _buf_cache , buffer_tell( _buf_cache ) );
    directory_destroy( _dir );
    return _buf_cache;
} else {
    show_error( "The image group '" + string( argument0 ) + "' you are trying to save does not exist" , false );
    return -1;
}
