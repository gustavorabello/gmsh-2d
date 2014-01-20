// Gmsh project created on Thu Jun  4 09:24:57 2009

nb = 1;
b1 = 0.04;
wall = 0.04;

D = 1.0;
r = 0.3*D;
body = 1.5*D;
slug = 0.7*r;

For t In {0:nb-1}
 // bubble's coordinates
 xc = 0.5+(slug+body+r+r/2.0)*t;
 yc = 0.0;
 zc = 0.0;

 // include torus.geo file
 Include '../bubbleShape/taylor.geo';
EndFor

A = 0.05;
k = 1;
stretch=10;
phase = 0;
nCycles = 3;
nPoints = 18;
nTheta = 4;

k = 10000;
j = 1+k;
// top line
For i In {1:nPoints}
 X = stretch*( (i-1)/(nPoints-1) );
 Y = 0.5 + A*Sin(nCycles*2*Pi/stretch*X-phase);
 Point(j) = {X, Y, 0, wall};
 j = j + 1;
EndFor

// bottom line
For i In {1:nPoints}
 X = stretch*( (i-1)/(nPoints-1) );
 Y = -0.5 - A*Sin(nCycles*2*Pi/stretch*X-phase);
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

Physical Line('wallNoSlip') = {k+1:k+(nPoints-1)*2:1};
Physical Line('wallInflowUParabolic') = {s1};
Physical Line('wallOutflow') = {s1+1};

j=200*0;
For t In {1:nb}
Physical Line(Sprintf("bubble%g",t)) = {j+6, j+2, j+1, j+5, j+4, j+3};
 j=200*t;
EndFor

