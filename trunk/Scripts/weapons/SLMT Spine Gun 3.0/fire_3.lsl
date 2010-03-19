﻿default
{
    state_entry()
    {
        llRequestPermissions(llGetOwner(), PERMISSION_TRACK_CAMERA);
    }
    
    link_message(integer sender, integer num, string message, key id)
    {
        if (num == 3)
        {
            llRezObject(message, llGetCameraPos()+<0.5,0.25,0.025>*llGetCameraRot(), <100,0,0>*llGetCameraRot(), llGetCameraRot(), 1);
        }
        
        if (num == 0)
        {
            llResetScript();
        }
    }
}