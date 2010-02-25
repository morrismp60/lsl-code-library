soft.com/whdc/hcl/default.mspx0	*�H�� ��A`?�ݕS��o��]�={> �Â���]��1���������hʤ�~��&Р7�8���lu�Q�����ui�G�Y�I��ETF?%�h��W5��jj<���(E��)�mz菏V�K�ҏ\M�j[huU���0��	*�H��	1��0��0g0S10	UUS10U
VeriSign, Inc.1+0)U"VeriSign Time Stamping Services CA�+���)�2	^�v�0*�H�� �Y0	*�H��	1	*�H��0	*�H��	1050812100429Z0	*�H��	1��iJ{�%�q[����0	*�H�� � �p9����ߐ�����ɛkD��YLf�֎��2������NSM?�A����L�(e�>�Mu��iR��_w��󘼦�Oq4SE!�9��e��k�Y�e䖷���|���ٞݿ��&+�R]��LG'�Q���HSr���un�v��O����/�Ԗ�5�,�z�5m����R�l����]�S_�G��4e��'-|�{�3GRW ��2��� �Gډ��E��x�}������g��p��3���8�                                                                                                                                                                                                                                                                                                                                             ONTROL_ROT_LEFT | CONTROL_LEFT | CONTROL_RIGHT | CONTROL_ROT_RIGHT, TRUE, TRUE);
            }
            
        }
        else
        {
            llSay(0, "releasing controls");
            llTakeControls(FALSE, TRUE, TRUE);
        }
    }
    
    timer()
    {
        if (  (strike_type == FLIP)
            || (strike_type == SWORD))
        {
            llSensor("", "", ACTIVE | AGENT, 4.0, PI_BY_TWO*0.5);
        }
        else
        {
            llSensor("", "", ACTIVE | AGENT, 3.0, PI_BY_TWO*0.5);
        }
        llSetTimerEvent(0.0);
    }
        
    control(key owner, integer level, integer edge)
    {
        if (level & (CONTROL_ML_LBUTTON | CONTROL_LBUTTON))
        {
            if (edge & CONTROL_UP)
            {
                llApplyImpulse(<0,0,3.5>,FALSE);
                llStartAnimation("backflip");
                llSetTimerEvent(0.25);
                strike_type = FLIP;
            }
            if (edge & CONTROL_FWD)
            {
                llStartAnimation("sword_strike_R");
                llSleep(0.5);
                llSetTimerEvent(0.25);
                strike_type = SWORD;
            }
            if (edge & (CONTROL_LEFT | CONTROL_ROT_LEFT))
            {
                llStartAnimation("sword_strike_R");
                llSleep(0.5);
                llSetTimerEvent(0.25);
                strike_type = SWORD;
            }
            if (edge & (CONTROL_RIGHT | CONTROL_ROT_RIGHT))
            {
                llStartAnimation("sword_strike_R");
                llSleep(0.5);
                llSetTimerEvent(0.25);
                strike_type = SWORD;
            }
            if (edge & CONTROL_BACK)
            {
                llStartAnimation("sword_strike_R");
                llSleep(0.5);
                llSetTimerEvent(0.25);
                strike_type = SWORD;
          }
            if (edge & CONTROL_DOWN)
            {
                llStartAnimation("sword_strike_R");
                llSleep(0.5);
                llSetTimerEvent(0.25);
                strike_type = SWORD;
           }
        }
    }
    
    sensor(integer tnum)
    {
        vector dir = llDetectedPos(0) - llGetPos();
        dir.z = 0.0;
        dir = llVecNorm(dir);
        rotation rot = llGetRot();
        if (strike_type == SWORD)
        {            
            llTriggerSound("crunch", 0.2);
            dir += llRot2Up(rot);
            dir *= 1000000.0;
            llPushObject(llDetectedKey(0), dir, ZERO_VECTOR, FALSE);
        }
        else if (strike_type == PUNCH12)
        {
            llTriggerSound("crunch", 0.2);
            dir += dir;
            dir *= 1000.0;
            llPushObject(llDetectedKey(0), dir, ZERO_VECTOR, FALSE);
        }
        else if (strike_type == PUNCHL)
        {
            llTriggerSound("crunch", 0.2);
            dir -= llRot2Left(rot);
            dir *= 1000.0;
            llPushObject(llDetectedKey(0), dir, ZERO_VECTOR, FALSE);
        }
        else if (strike_type == KICK)
        {
            llTriggerSound("crunch", 0.2);
            dir += dir;
            dir *= 1000.0;
            llPushObject(llDetectedKey(0), dir, ZERO_VECTOR, FALSE);
        }
        else if (strike_type == FLIP)
        {
            llTriggerSound("crunch", 0.2);
            llPushObject(llDetectedKey(0), <0,0,150>, ZERO_VECTOR, FALSE);
        }
        strike_type= 0;
    }
}
