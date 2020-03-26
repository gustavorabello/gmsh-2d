// Gmsh project created on Thu Jun  4 09:24:57 2009

wall = 0.09;

A = 0.07;
k = 1;
stretch=8;
phase = 0;
nCycles = 2;
nPoints = 24;
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
 Y = 0.0;
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

Physical Line('wallTop') = {k+1:k+(nPoints-1):1};
Physical Line('wallBottom') = {1+k+(nPoints-1):k+(nPoints-1)*2:1};
Physical Line('wallLeft') = {s1};
Physical Line('wallRight') = {s1+1};

//+
Curve Loop(1) = {10006, 10007, 10008, 10009, 10010, 10011, 10012, 10013, 10014, 10015, 10016, 10017, 10018, 10019, 10020, 10021, 10022, 10023, 10048, -10046, -10045, -10044, -10043, -10042, -10041, -10040, -10039, -10038, -10037, -10036, -10035, -10034, -10033, -10032, -10031, -10030, -10029, -10028, -10027, -10026, -10025, -10024, -10047, 10001, 10002, 10003, 10004, 10005};
//+
Plane Surface(1) = {1};
//+
Physical Surface(5) = {1};
