
nb = 1;
b1 = 0.04;
wall = 5*b1;

D = 1.0;
r = 0.5*D;
pert = (0.0/100)*r;

For t In {0:nb-1}
 // bubble's coordinates
 xc = 0.0;
 yc = 0.0;

 // include torus.geo file
 Include '../../bubbleShape/circle.geo';
EndFor

k=10000;
Point(k+6) = {-2*D, -2*D, 0,wall};
Point(k+7) = { 2*D, -2*D, 0,wall};
Point(k+8) = { 2*D,  2*D, 0,wall};
Point(k+9) = {-2*D,  2*D, 0,wall};

Line(k+5) = {k+9, k+8};
Line(k+6) = {k+8, k+7};
Line(k+7) = {k+7, k+6};
Line(k+8) = {k+6, k+9};

//Physical Line('wallNoSlip') = {k+6, k+7, k+8, k+5};
Physical Line('wallNoSlipPressure') = {k+6, k+7, k+8, k+5};

j=200*0;
For t In {1:nb}
Physical Line(Sprintf("bubble%g",t)) = {j+1, j+2, j+3, j+4};
 j=200*t;
EndFor

