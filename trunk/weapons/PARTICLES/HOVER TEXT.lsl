﻿// Hovering Text Script
// Written by and Comments by: Malaer Sunchaser
// Very Simple Script that allows you to hover text over an object.
// How The Script Works:
// llSetText() Specifies for the object to create text above it.  
//
// Customizing the script:
// Change the text inside of "TEXT GOES HERE" to whatever you please.
// The <1.0,1.0,1.0> is the color the text will show in Float form, 1.0,1.0,1.0
// being WHITE while, 0.0, 0.0, 0.0 is BLACK this is all in RGB (Red, Green, Blue).
// experiement with combinations to get different colors.
// The 1 at the end sets the text's transparency, 1.0 being SOLID, while 0 would be clear,
// and .5 would be half way between clear and solid.

default
{
    state_entry()
    {
        llSetText("PARTICLES", <0.0,0.0,0.0>, 1);
    }
}