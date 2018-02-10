///image_stream_add(group,identifier,fname,subimg,xorig,yorig)
var _l = global.m_ex_image[? argument0 ];

// Error checking
if( ds_list_size( _l ) != 3 ){
    show_error( "Image stream not started " + chr(13) + "Group: " + string( argument0 ) + chr(13) + "Identifier " + string( argument1 ), true );
    return false; 
}

var _m = _l[| 2 ];
var _p_sprite = _m[? "sprite" ];

var _spr  = sprite_add( argument2 , argument3 , false , false , argument4 , argument5 );
var _priority = floor( ( sprite_get_width( _spr ) + sprite_get_height( _spr ) ) / 2 );
var _l = ds_list_create();

ds_list_add( _l , _spr , string( argument1 ) , argument2 );


if( _priority <= 1 and !file_exists( argument2 ) ){
    var _l_loading = _m[? "loading" ];
    ds_list_add( _l_loading , _l );
    _m[? "finished" ] = false;
}


ds_priority_add(
    _p_sprite ,
    _l ,
    _priority
);

// back_req , identifier , subimg , xorig , yorig , link , loaded


