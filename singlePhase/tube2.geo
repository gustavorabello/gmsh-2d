// Gmsh project created on Fri Feb  6 14:28:22 2009

nb = 1;
b1 = 0.04;
wall = 0.1;

D = 1.0;
r = 0.5*D;
body = 1.0*D;
slug = 0.7*r;
pert = (0.0/100)*r;

For t In {0:nb-1}
 // bubble's coordinates
 xc = 2.0+(slug+body+r+r/2.0)*t;
 yc = 2.0;

 // include torus.geo file
 Include '../bubbleShape/circle.geo';
EndFor

k=10000;
Point(k+6) = {0, 0, 0,wall};
Point(k+7) = {4*D, 0, 0,wall};
Point(k+8) = {4*D, 8*D, 0,wall};
Point(k+9) = {0, 8*D, 0,wall};

Line(k+5) = {k+9, k+8};
Line(k+6) = {k+8, k+7};
Line(k+7) = {k+7, k+6};
Line(k+8) = {k+6, k+9};

//Physical Line('wallNoSlip') = {k+6, k+7, k+8, k+5};
Physical Line('wallNoSlip') = {k+6, k+7, k+8};
Physical Line('wallOutflow') = {k+5};

