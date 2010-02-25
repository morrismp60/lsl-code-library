﻿integer on = FALSE;
lazer()
{
// Particle Parameters taken from script by  Jopsy Pendragon
        llParticleSystem( [  
            PSYS_SRC_PATTERN, PSYS_SRC_PATTERN_ANGLE, 
            PSYS_SRC_BURST_PART_COUNT,(integer) 20,   // adjust for beam strength,
            PSYS_SRC_BURST_RATE,(float) .05,          
            PSYS_PART_MAX_AGE,(float)  .6,            
            PSYS_SRC_BURST_SPEED_MIN,(float)1,        
            PSYS_SRC_BURST_SPEED_MAX,(float) 7.0,      
            PSYS_PART_START_SCALE,(vector) <0,.1,0>, 
            PSYS_PART_END_SCALE,(vector) <.04,.5,0>,   
            PSYS_PART_START_COLOR,(vector) <1,0,0>,  
            PSYS_PART_END_COLOR,(vector) <.2,0,0>,   
            PSYS_PART_START_ALPHA,(float)0.5,          
            PSYS_PART_END_ALPHA,(float)0.00,          
            PSYS_PART_FLAGS,
                 PSYS_PART_EMISSIVE_MASK |     
                 PSYS_PART_FOLLOW_VELOCITY_MASK |
                 PSYS_PART_FOLLOW_SRC_MASK |   
                 PSYS_PART_INTERP_SCALE_MASK                  
        ] );
}

switch()
{
    if ( on == TRUE )
    {
        on == FALSE;
        llParticleSystem([]);
        llOwnerSay ("Lazer is OFF" );
    }
    else
    {
        on == TRUE;
        lazer();
        llOwnerSay( "Lazer is ON" );
    }
}   

init()
{
    switch();
}

default
{
    state_entry() 
    {
        init();
    }
    on_rez( integer param )
    {
        init();
    }
    touch_start( integer num )
    {
        switch();
    }
} 
 