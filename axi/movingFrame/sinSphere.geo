// Gmsh project created on Thu Jun  4 09:24:57 2009

nb = 1;
b1 = 0.04;
wall = 0.04;

D = 1.0;
r = 0.3*D;
slug = 1.5*D;
pert = (0.0/100.0)*r;

ll = 1.5*D; // length of the left section
dist = 1.0*r; // distance from the bubble to the left and right sections

/* sinusoidal wall configuration
 *
 *                      2*pi
 * Eq.: y(x) = A sin( -------- * X - phase)
 *                     lambda
 *
 * A = amplitude
 * lambda = wavelength (channel length / number of corrugations )
 * X = x coordinate
 * phase = phase displacement
 *
 *       2*pi
 * k = -------- --> wave number
 *      lambda
 * */
A = 0.07;
stretch = 4;
lambda = 4;
wavenum = 2*Pi/lambda; 
xcf = 0.15*10.0;    // xc of the fixed sinSphere.geo
xcm = 0.65*stretch; // xc of the moving sinSphere.geo (current)
phase = wavenum*(xcm-xcf); 
nCycles = stretch/lambda;
nPoints = 40; // total number of points in the sinusoidal line

For t In {0:nb-1}
 // bubble's coordinates
 xc = xcm + (slug+r)*t;
 yc = 0.0;
 zc = 0.0;

 // include torus.geo file
 Include '../../bubbleShape/sphereAxi.geo';
EndFor

k = 10000;
j = 1+k;
// top line
For i In {1:nPoints}
 X = stretch*( (i-1)/(nPoints-1) );
 Y = D/2.0 + A*Sin(wavenum*X-phase);
 Point(j) = {X, Y, 0, wall};
 j = j + 1;
EndFor

j = 1+k;
// lines
For i In {1:nPoints-1}
 Line(j) = {j, j+1};
 j = j + 1;
EndFor

k = newp;
/*  
 *   k+1             k+2  6           3  k+3               k+5
 *    o----------------o---o------------o---o-----------------o
 *    
 *    |           ll          | r | r |           lr          |
 *    |<--------------------->|<->|<->|<--------------------->|
 *    |                        stretch                        |
 *    |<----------------------------------------------------->|
 */

Point(k+1) = {0.0, 0.0, 0.0, wall};
Point(k+2) = {stretch,   0.0, 0.0, wall};

// at symmetry axis, the nodes should be connected, since interface is
// also at the axis. It is not possible to have a straigth line
// connecting the extreme edges of the domain (k+1 to k+5)
bl = newl; Line(bl) = { 1, 4 };
br = newl; Line(br) = { 3, 1 };
right = newl; Line(right) = { 10000+nPoints+3,3 };
left = newl; Line(left) = {4, 10000+nPoints+2};
in = newl; Line(in) = {k+1, k-nPoints};
out = newl; Line(out) = {k+2, k-1};

Physical Line('wallInflowZeroU') = {-out};
Physical Line('wallMovingY') = {k-nPoints:k-2:1};
Physical Line('wallOutflow') = { in };
Physical Line('wallNormalV') = { left, bl, br, right };  // symmetry bc

j=200*0;
For t In {1:nb}
Physical Line(Sprintf("bubble%g",t)) = {j+1, -1*(j+2)};
 j=200*t;
EndFor
