﻿default
{
    state_entry()
    {
        llListen(0,"",llGetOwner(),"");
    }

    on_rez(integer start_param)
    {
        llSay(0,"say /help in chat for a note card");
        llResetScript();
    } 
     
     
     
     
     
     
     
     listen(integer channel, string name, key id, string message)
    {
        if(message == "gd")//Insert message to make invisible
        {
            
       llMessageLinked(LINK_SET, 0, "close pods", NULL_KEY);
       // llSetScriptState("K",TRUE);     
    }
    if(message == "gu")//Insert message to make visible
        {
        llMessageLinked(LINK_SET, 0, "open pods", NULL_KEY);
         //llSetScriptState("K",FALSE);  
            
    } if(message=="/help"){
          llGiveInventory(llGetOwner(), "help");    
        } 
   
    if(message == "silid")//Insert message to make solid
        {
            
            
    }
    if(message == "die")//Insert kill command
        {
            
        }
    
    }
    
}
