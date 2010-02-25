﻿//script for sitting cross legged on an object
//by Ananda Sandgrain - free to distribute but please don't sell!

key avatar;
vector pos = <-0.25,0,0.8>;  //adjust the position to fit object -must be 
//nonzero in at least one direction or script will not work!
rotation rot = <0,0,0,1>; //adjust rotation (1 in any vector gives 90 deg)

default
{
    state_entry()
    {
        llSitTarget(pos, rot);
    }
    changed(integer change)
    {
        avatar = llAvatarOnSitTarget();
       if(change & CHANGED_LINK)
       {
           if(avatar == NULL_KEY)
           {
                //  You have gotten off
                llStopAnimation("sit_ground");
                llReleaseControls();
                llResetScript();
           }
           else if(avatar == llAvatarOnSitTarget())
           {
                // You have gotten on
                llRequestPermissions(avatar,PERMISSION_TRIGGER_ANIMATION );
           }
        }
    }
        run_time_permissions(integer perms)
        {
        if(perms)
        {
            llStopAnimation("sit");
            llStartAnimation("sit_ground");
        }
        else
        {
            llUnSit(avatar);
        }
    }
}
