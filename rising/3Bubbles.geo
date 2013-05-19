// Gmsh project created on Fri Feb  6 14:28:22 2009

nb = 3;
wall = 0.6;
D = 1.0;
body = 1.0*D;

// bubble 1
b1 = 0.1;
r = 0.5*D;
pert = (0.0/100)*r;
t=1;
xc = 2.0;
yc = 2.5;
Include '../bubbleShape/circle.geo';

// bubble 2
b1 = 0.06;
r = 0.3*D;
pert = (0.0/100)*r;
xc = 3.0;
yc = 1.5;
t=2;
Include '../bubbleShape/circle.geo';

// bubble 3
b1 = 0.06;
r = 0.3*D;
pert = (0.0/100)*r;
xc = 1.0;
yc = 1.0;
t=3;
Include '../bubbleShape/circle.geo';

k=10000;
Point(k+6) = {0, 0, 0,wall};
Point(k+7) = {4*D, 0, 0,wall};
Point(k+8) = {4*D, 14*D, 0,wall};
Point(k+9) = {0, 14*D, 0,wall};

Line(k+5) = {k+9, k+8};
Line(k+6) = {k+8, k+7};
Line(k+7) = {k+7, k+6};
Line(k+8) = {k+6, k+9};

Physical Line('wallNoSlip') = {k+6, k+7, k+8, k+5};

j=200*0;
For t In {1:nb}
Physical Line(Sprintf("bubble%g",t)) = {j+1, j+2, j+3, j+4};
 j=200*t;
EndFor

