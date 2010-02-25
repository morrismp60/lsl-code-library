//////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////
//// eltee Statosky's Particle Creation Engine 1.0
//// 01/09/2004
//// *PUBLIC DOMAIN*
//// Free to use
//// Free to copy
//// Free to poke at
//// Free to hide in stuff you sell
//// Just please leave this header intact
//////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////
integer CHANNEL = 50;
integer effectFlags=0;
integer running=TRUE;


///////////////////////////////////////////////////////
// Color Secelection Variables
///////////////////////////////////////////////////////
// Interpolate between startColor and endColor
integer colorInterpolation  = TRUE;
// Starting color for each particle 
vector  startColor          = <1, 1, 1>;
// Ending color for each particle
vector  endColor            = <1.0, 1, 1>;
// Starting Transparency for each particle (1.0 is solid)
float   startAlpha          = 0.5;
// Ending Transparency for each particle (0.0 is invisible)
float   endAlpha            = 0.0;
// Enables Absolute color (true) ambient lighting (false)
integer glowEffect          = TRUE;


///////////////////////////////////////////////////////
// Size & Shape Selection Variables
///////////////////////////////////////////////////////
// Interpolate between startSize and endSize
integer sizeInterpolation   = TRUE;
// Starting size of each particle
vector  startSize           = <0.8, 0.8, 0.5>;
// Ending size of each particle
vector  endSize             = <1, 1, 0.6>;
// Turns particles to face their movement direction
integer followVelocity      = TRUE;
// Texture the particles will use ("" for default)
string  texture             = "kamehamehaball";


///////////////////////////////////////////////////////
// Timing & Creation Variables Variables
///////////////////////////////////////////////////////
// Lifetime of one particle (seconds)
float   particleLife        = 1;
// Lifetime of the system 0.0 for no time out (seconds)
float   SystemLife          = 0.0;
// Number of seconds between particle emissions
float   emissionRate        = 0;
// Number of particles to releast on each emission
integer partPerEmission     = 5;

///////////////////////////////////////////////////////
// Angular Variables
///////////////////////////////////////////////////////
// The radius used to spawn angular particle patterns
float   radius              = 0;
// Inside angle for angular particle patterns
float   innerAngle          = 0;
// Outside angle for angular particle patterns
float   outerAngle          = 0;
// Rotational potential of the inner/outer angle
vector  omega               = <0, 1, 0>;


///////////////////////////////////////////////////////
// Movement & Speed Variables
///////////////////////////////////////////////////////
// The minimum speed a particle will be moving on creation
float   minSpeed            = 0;
// The maximum speed a particle will be moving on creation
float   maxSpeed            = 0;
// Global acceleration applied to all particles
vector  acceleration        = <0.0, 0.0, 0.025>;
// If true, particles will be blown by the current wind
integer windEffect          = FALSE;
// if true, particles 'bounce' off of the object's Z height
integer bounceEffect        = FALSE;
// If true, particles spawn at the container object center
integer followSource        = TRUE;
// If true, particles will move to expire at the target
//integer followTarget        = TRUE;
// Desired target for the particles (any valid object/av key)
// target Needs to be set at runtime
key     target              = "";


///////////////////////////////////////////////////////
//As yet unimplemented particle system flags
///////////////////////////////////////////////////////
integer randomAcceleration  = FALSE;
integer randomVelocity      = FALSE;
integer particleTrails      = FALSE;

///////////////////////////////////////////////////////
// Pattern Selection
///////////////////////////////////////////////////////
//  e   r e s t   o f   t h e   a g r e e m e n t .   T o   c o n t i n u e   w i t h   S e t u p ,   y o u   m u s t   a c c e p t   t h e   a g r e e m e n t .              �P L � m    ���              P � � 
   ��� & A c c e p t   t h e   L i c e n s e   A g r e e m e n t                 PB � 2    ��� & R e a d   M e               X~ � 2     ��� & C o n t i n u e                 P� � 2     ��� C a n c e l     K L O G :   % 1   w a s   n o t   i n s t a l l e d ,   b e c a u s e   i t   c a n n o t   b e   i n s t a l l e d   o n   t h i s   p l a t f o r m 
   , P l e a s e   i n s e r t   % 1   % 2 ! d !   i n t o   t h e   C D - R O M   d r i v e   f I n s t a l l a t i o n   r e q u i r e s   % 1 ! l d !   K b y t e s   i n   y o u   s y s t e m   d r i v e ,   b u t   t h e r e   a r e   o n l y   % 2 ! l d !   K b y t e s   a v a i l a b l e . 
 
  I n s u f f i c i e n t   D i s k   S p a c e r Y o u   h a v e   u n i n s t a l l e d   c u r r e n t   U I   l a n g u a g e .   Y o u   m u s t   r e s t a r t   t h e   c o m p u t e r . 
 
 D o   y o u   w a n t   t o   r e s t a r t   t h e   c o m p u t e r   n o w ? ! T h e   f i l e   M U I . I N F   c a n n o t   b e   f o u n d .  m u i s e t u p . h l p  I n s t a l l a t i o n   E r r o r   1 E R R O R :   U n a b l e   t o   r e a d   c o m p o n e n t   n a m e   i n   M U I . I N F . 
 ] E R R O R :   M U I   f i l e s   f o r   c o m p o n e n t   % 1   w e r e   n o t   i n s t a l l e d   b e c a u s e   o f   m i s s i n g   c o m p o n e n t   d i r e c t o r y . 
 ` E R R O R :   M U I   f i l e s   f o r   c o m p o n e n t   % 1   w e r e   n o t   i n s t a l l e d   b e c a u s e   o f   m i s s i n g   c o m p o n e n t   I N F   f i l e n a m e . 
 \ E R R O R :   M U I   f i l e s   f o r   c o m p o n e n t   % 1   w e r e   n o t   i n s t a l l e d   b e c a u s e   s e t u p   w a s   n o t   a b l e   t o   r e a d   % 2 . 
 r E R R O R :   M U I   f i l e s   f o r   c o m p o n e n t   % 1   w e r e   n o t   i n s t a l l e d   b e c a u s e   t h e   c o p y   o p e r a t i o n   f a i l e d .   T h e   e r r o r   c o d e   i s   0 x % 2 ! x ! .             w W i n d o w s   X P   M u l t i l i n g u a l   U s e r   I n t e r f a c e   P a c k   c a n   o n l y   b e   i n s t a l l e d   o n   E n g l i s h   W i n d o w s   X P .  
 B u i l d   v e r s i o n s   h a v e   t o   m a t c h . $ I n s t a l l a t i o n   c o m p l e t e d   s u c c e s s f u l l y .  I n s t a l l a t i o n   C o m p l e t e b O n e   o r   m o r e   e r r o r s   o c c u r r e d   d u r i n g   i n s t a l l a t i o n .  
 P l e a s e   s e e   % 1 \ M U I S E T U P . L O G   f o r   m o r e   i n f o r m a t i o n . " L O G :   N o   l a n g u a g e s   f o u n d   i n   M U I . I N F   S T h e   d e f a u l t   u s e r   l a n g u a g e   y o u   h a v e   s e l e c t e d  
 i s   n o t   v a l i d .   P l e a s e   s e l e c t   a   n e 