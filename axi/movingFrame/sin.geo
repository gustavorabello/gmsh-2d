// Gmsh project created on Thu Jun  4 09:24:57 2009

nb = 1;
b1 = 0.04;
wall = 0.04;

D = 1.0;
r = 0.3*D;
body = 1.5*D;
slug = 0.7*r;

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
phase = 0.0;
stretch=8;
nCycles = 2;
lambda = stretch/nCycles;
wavenum = 2*Pi/lambda; 
nPoints = 40; // total number of points in the sinusoidal line
nTheta = 4; // number of rotations

For t In {0:nb-1}
 // bubble's coordinates
 xc = 1.25*lambda+(slug+body+r+r/2.0)*t;
 yc = 0.0;
 zc = 0.0;

 // include torus.geo file
 //Include '../../bubbleShape/sphereAxi.geo';
 Include '../../bubbleShape/taylorAxi.geo';
EndFor

k = 10000;
j = 1+k;
// top line
For i In {1:nPoints}
 X = stretch*( (i-1)/(nPoints-1) );
 //Y = D/2.0 + A*Sin(nCycles*2*Pi/stretch*X-phase);
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

/*  
 *   k+1             k+2  6           3  k+3               k+5
 *    o----------------o---o------------o---o-----------------o
 *    
 *    |       ll       | r |     body   | r |       lr        |
 *    |<-------------->|<->|<---------->|<->|<--------------->|
 */

k = k + nPoints;
Point(k+1) = {0.0, 0.0, 0.0, wall};
Point(k+2) = {stretch, 0.0, 0.0, wall};

Line(k+1) = {k+2, 3};
Line(k+2) = {3, 1};
Line(k+3) = {1, 4};
Line(k+4) = {4, k+1};

// lines in both ends
Line(k+5) = {k+1, k-nPoints+1};
Line(k+6) = {k+2, k+0};

Physical Line('wallInflowZeroU') = {k+6};
Physical Line('wallOutflow') = {k+5};
Physical Line('wallMovingY') = {k-nPoints+1:k-1:1};
Physical Line('wallNormalV') = {k+1,k+2,k+3,k+4};

j=200*0;
For t In {1:nb}
Physical Line(Sprintf("bubble%g",t)) = {j+6, j+2, j+1, j+5, j+4, j+3};
 j=200*t;
EndFor


 
