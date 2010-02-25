// CATEGORY:Vehicles
// CREATOR:Ferd Frederiex
// DESCRIPTION:Car Front Wheel (realistic).lsl
// ARCHIVED BY:Ferd Frederix

rotation Inverse(rotation r)
{
    r.x = -r.x;
    r.y = -r.y;
    r.z = -r.z;
    return r;
}
rotation GetParentRot()
{
    return Inverse(llGetLocalRot())*llGetRot(); 
}
SetLocalRot(rotation x)
{
    llSetRot(x*Inverse(GetParentRot()));
}

default
{
    state_entry()
    {
    }

   link_message(integer sender_num, integer num, string str, key id)
    {
        if(str == "WHEEL_DRIVING")
        {
            state driving;
        }                                               
    }
        
}

state driving
{
    state_entry()
    {
        SetLocalRot(llEuler2Rot(<-1 * PI_BY_TWO,0,0> ));
        llSetTimerEvent(0.5);
    }

    timer()
    {
        vector vel = llGetVel();
        float speed = llVecMag(vel);
         llSetTextureAnim(ANIM_ON|LOOP|SMOOTH|ROTATE,ALL_SIDES,0,0,0,0,speed);
    }

   link_message(integer sender_num, integer num, string str, key id)
    {
        if(str == "WHEEL_DEFAULT")
        {
            state default;
        }
  
        if(str == "WHEEL_FORWARD")
        {    
            SetLocalRot(llEuler2Rot(<-1 * PI_BY_TWO,0,0> ));  
        }
  
        if(str == "WHEEL_REVERSE")
        {
            SetLocalRot(llEuler2Rot(<-1 * PI_BY_TWO,0,0> ));
        }
                    
        if(str == "WHEEL_LEFT")
        {
            SetLocalRot(llEuler2Rot(<-1 * PI_BY_TWO, -1 * PI_BY_TWO / 2, 0> ));
        }
        
        if(str == "WHEEL_RIGHT")
        {
            SetLocalRot(llEuler2Rot(<-1 * PI_BY_TWO, PI_BY_TWO / 2, 0> ));
        }
                   
    }
    
    state_exit()
    {
        SetLocalRot(llEuler2Rot(<-1 * PI_BY_TWO,0,0> ));
        llSetTextureAnim(0,ALL_SIDES,0,0,0,0,0);
    }
    
}
// END //
