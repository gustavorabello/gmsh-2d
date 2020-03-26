// Gmsh project created on Thu Jun  4 09:24:57 2009

wall = 0.03;

A = 0.05;
k = 1;
stretch=6;
phase = 0;
nCycles = 2;
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

Physical Line('wallNoSlipSinTop') = {k+1:k+(nPoints-1):1};
Physical Line('wallNoSlipSinBottom') = {1+k+(nPoints-1):k+(nPoints-1)*2:1};
Physical Line('wallInflowU') = {s1};
Physical Line('wallOutflow') = {s1+1};

