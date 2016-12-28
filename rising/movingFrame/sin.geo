// Gmsh project created on Thu Jun  4 09:24:57 2009

nb = 1;
b1 = 0.03;
wall = 0.03;

D = 1.0;
kappa = 0.92; // kappa = 0.54, 0.78, 0.92
r = kappa*D/2.0;
body = 1*D;
slug = 0.7*r;
pert = (0.0/100.0)*r;

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
 //Include '../../bubbleShape/taylor.geo';
 Include '../../bubbleShape/circle.geo';
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

// bottom line
For i In {1:nPoints}
 X = stretch*( (i-1)/(nPoints-1) );
 //Y = - D - A*Sin(nCycles*2*Pi/stretch*X-phase);
 Y = - D/2.0 - A*Sin(wavenum*X-phase);
 Point(j) = {X, Y, 0, wall};
 j = j + 1;
EndFor

j = 1+k;
// lines
For i In {1:nPoints-1}
 Line(j) = {j, j+1};
 j = j + 1;
EndFor

 j = j + 1;
For i In {1:nPoints-1}
 Line(j-1) = {j, j+1};
 j = j + 1;
EndFor

// lines in both ends
s1=newreg;
Line(s1) = {k+1, k+1+nPoints};
Line(s1+1) = {k+nPoints, k+2*nPoints};

Physical Line('wallInflowZeroU') = {s1+1};
Physical Line('wallOutflow') = {s1};
Physical Line('wallMovingY') = {k+1:k+(nPoints-1)*2:1};

j=200*0;
For t In {1:nb}
Physical Line(Sprintf("bubble%g",t)) = {j+6, j+2, j+1, j+5, j+4, j+3};
 j=200*t;
EndFor

