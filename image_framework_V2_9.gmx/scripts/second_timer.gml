#define second_timer
///second_timer()

t = 1;

show_debug_message( "hi!" );



#define timer_init
///timer_init()
_TL = timeline_add();
timeline_moment_add_script(_TL, room_speed, second_timer);
timeline_index = _TL;
timeline_loop = true;
timeline_running = true;
