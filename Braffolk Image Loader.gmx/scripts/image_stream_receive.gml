///image_stream_receive(group)
if( !ds_exists( async_load , ds_type_map ) ){
    show_error( "image_stream_receive() can only be used in Image Loaded event" , true );
    return false;
}

// Async data
var _id     = async_load[? "id" ];
var _fname  = async_load[? "filename" ];
var _status = async_load[? "status" ];

// Image stream data 
var _l = global.m_ex_image[? argument0 ];
if( ds_list_size( _l ) != 3 ){
    show_error( "Image stream not started." + chr(13) + "Group: " + string( argument0 ) , true );
}
var _m            = _l[| 2 ];
var _l_loading    = _m[? "loading" ];
var _l_loading_3d = _m[? "loading_3d" ];
var _p_sprite       = _m[? "sprite" ];
var _p_sprite_3d    = _m[? "sprite_3d" ];


// Check if we got the data.
for( var n = 0; n < ds_list_size( _l_loading ); n++ ){
    var _l_sprite = _l_loading[| n ];
    if( _l_sprite[| 0 ] == _id ){
        if( _status >= 0 ){
            show_debug_message( "RECEIVED " + string( _l_sprite[| 2 ] ) );
            ds_list_delete( _l_loading , n );
            n--;
            var _priority = ( sprite_get_width( _id ) + sprite_get_height( _id ) ) / 2;
            ds_priority_change_priority( _p_sprite , _l_sprite , _priority );
            continue;
        } else {
            show_debug_message( "Failed to load image, requesting again." + chr(13) + "Identifier: " + string( _l_sprite[| 1 ] ) + chr(13) + "Group: " + string( argument0 ) + chr(13) + "Error: " + string( _status ) );
            
            _l_sprite[| 0 ] = sprite_add( _l_sprite[| 2 ] , sprite_get_number( _id ) , false , false , sprite_get_xoffset( _id ) , sprite_get_yoffset( _id ) );
            sprite_delete( _id );
        }
    }
}

for( var n = 0; n < ds_list_size( _l_loading_3d ); n++ ){
    var _l_sprite = _l_loading_3d[| n ];
    if( _l_sprite[| 0 ] == _id ){
        if( _status >= 0 ){
            show_debug_message( "RECEIVED " + string( _l_sprite[| 2 ] ) );
            ds_list_delete( _l_loading_3d , n );
            n--;
            var _priority = ( sprite_get_width( _id ) + sprite_get_height( _id ) ) / 2;
            ds_priority_change_priority( _p_sprite_3d , _l_sprite , _priority );
            continue;
        } else {
            show_debug_message( "Failed to load image, requesting again." + chr(13) + "Identifier: " + string( _l_sprite[| 1 ] ) + chr(13) + "Group: " + string( argument0 ) + chr(13) + "Error: " + string( _status ) );
            
            _l_sprite[| 0 ] = sprite_add( _l_sprite[| 2 ] , sprite_get_number( _id ) , false , false , sprite_get_xoffset( _id ) , sprite_get_yoffset( _id ) );
            sprite_delete( _id );
        }
    }
}

var _total  = ds_priority_size( _p_sprite ) + ds_priority_size( _p_sprite_3d );
if( _total != 0 ){
    var _loaded = _total - ( ds_list_size( _l_loading ) + ds_list_size( _l_loading_3d ) );
    
    // FIX PROGRESS
    _m[? "progress" ] = _loaded / _total;
    _m[? "finished" ] = _loaded == _total;
}
