// From the book:
//
// Scripting Recipes for Second Life
// by Jeff Heaton (Encog Dod in SL)
// ISBN: 160439000X
// Copyright 2007 by Heaton Research, Inc.
//
// This script may be freely copied and modified so long as this header
// remains unmodified.
//
// For more information about this book visit the following web site:
//
// http://www.heatonresearch.com/articles/series/22/

//
//  Encog's MultiBullet Gun Bullet
//
//  Push Bullet: This bullet will push an avatar high in the air
// 


default
{   
    on_rez(integer delay)
    {
        llSetStatus( STATUS_DIE_AT_EDGE, TRUE);
        llSetDamage(0);
        llSetBuoyancy(1.0);                 //  Make bullet float and not fall 
        llCollisionSound("", 1.0);          //  Disable collision sounds
        
        if (delay >0 ) 
        {
            llSetTimerEvent(delay);            
        }
    }

    collision_start(integer total_number)
    {
        if (llDetectedType(0) & AGENT)
        {
           llPushObject(llDetectedKey(0), <0,0,2147483647>, ZERO_VECTOR, FALSE);
        }
        llDie();
    }
    
    timer()
    {
        llDie();
    }
    
}

