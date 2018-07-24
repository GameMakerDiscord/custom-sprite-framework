///draw_text_outline(x,y,string,w)
draw_set_colour(c_black);
for( var n = 0; n < 360; n += 30 ){
    draw_text(argument0+lengthdir_x(argument3,n),argument1+lengthdir_y(argument3,n),argument2);
}

draw_set_colour(c_white);
draw_text(argument0,argument1,argument2);
