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

For t In {0:nb-1}
 // bubble's coordinates
 xc = (ll+dist)+(slug)*t;
 yc = 0.0;
 zc = 0.0;

 // include torus.geo file
 Include '../bubbleShape/sphereAxi.geo';
 //Include '../bubbleShape/taylorAxi.geo';
EndFor

A = 0.05;
D = 0.5;
k = 1;
stretch=8;
phase = 0;
nCycles = 2;
nPoints = 40;
nTheta = 4;

k = 10000;
j = 1+k;
// top line
For i In {1:nPoints}
 X = stretch*( (i-1)/(nPoints-1) );
 Y = D + A*Sin(nCycles*2*Pi/stretch*X-phase);
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


bl = newl; Line(bl) = { 1, 4 };
br = newl; Line(br) = { 3, 1 };
right = newl; Line(right) = { 10043,3 };
left = newl; Line(left) = {4, 10042};
in = newl; Line(in) = {k+1, k-nPoints};
out = newl; Line(out) = {k+2, k-1};


//Physical Line('wallNoSlip') = {k-nPoints:k+(nPoints-2):1,in};
Physical Line('wallNoSlip') = {k-nPoints:k-2:1,in};
Physical Line('wallOutflow') = { -out };
Physical Line('wallNormalV') = { left, bl, br, right };  // symmetry bc
Physical Line('bubble1') = {1,-2};
