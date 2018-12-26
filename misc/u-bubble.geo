

l = 10.0;     // letter length
h = 1.2*l;   // letter hight

nb = 4;
b1 = 0.06;
wall = 0.1;

D = 1.0;
body = 1.0*D;

// 1st. bubble's coordinates
t=0;
r = 0.5*D;
pert = (0.0/100)*r;
xc = 0.2*l;
yc = 0.45*l;
Include '../bubbleShape/circle.geo';

t=1;
r = 0.3*D;
pert = (0.0/100)*r;
xc = 0.7*l;
yc = 0.5*l;
Include '../bubbleShape/circle.geo';

t=2;
r = 0.65*D;
pert = (0.0/100)*r;
xc = 0.6*l;
yc = 0.1*l;
Include '../bubbleShape/circle.geo';

t=3;
r = 0.5*D;
pert = (0.0/100)*r;
xc = 0.89*l;
yc = 0.8*l;
Include '../bubbleShape/circle.geo';

// U
dx = 0.0;
k=10000;
Point(k+1)  = {      dx+0.0,     l/2.0, 0.0, wall};
Point(k+2)  = {      dx+0.0,         h, 0.0, wall};
Point(k+3)  = {      dx+0.4*l,       h, 0.0, wall};
Point(k+4)  = {      dx+0.4*l,   l/2.0, 0.0, wall};
Point(k+5)  = {    dx+l/2.0,     l/2.0, 0.0, wall};
Point(k+6)  = {      dx+0.6*l,   l/2.0, 0.0, wall};
Point(k+7)  = {dx+l/2.0+0.1*l,       h, 0.0, wall};
Point(k+8)  = {        dx+l,         h, 0.0, wall};
Point(k+9)  = {        dx+l,     l/2.0, 0.0, wall};
Point(k+10) = {    dx+l/2.0,       0.0, 0.0, wall};
Point(k+11) = {    dx+l/2.0, l/2.0-0.1*l, 0.0, wall};
Line(k+1) = {k+1, k+2};
Line(k+2) = {k+2, k+3};
Line(k+3) = {k+3, k+4};
Circle(k+4) = {k+4, k+5, k+11};
Circle(k+5) = {k+11, k+5, k+6};
Line(k+6) = {k+6, k+7};
Line(k+7) = {k+7, k+8};
Line(k+8) = {k+8, k+9};
Circle(k+9) = {k+1, k+5, k+10};
Circle(k+10) = {k+10, k+5, k+9};

Physical Line("wallNoSlip") = {k+02, k+01, k+09, k+10, k+08, k+07, k+06, k+05, k+04, k+03};

j=200*0;
For t In {1:nb}
Physical Line(Sprintf("bubble%g",t)) = {j+1, j+2, j+3, j+4};
 j=200*t;
EndFor

//+
