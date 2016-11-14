
nb = 1;
b1 = 0.03;
wall = 0.1;

D = 1.0;
r = 0.5*D;
body = 1.0*D;
slug = 0.7*r;
pert = (0.0/100)*r;

For t In {0:nb-1}
 // bubble's coordinates
 xc = 5.0*r;
 yc = 2.0*r;

 // include torus.geo file
 Include '../bubbleShape/circle.geo';
EndFor

k=10000;
Point(k+6) = {0, 0, 0,wall};
Point(k+7) = {5*D, 0, 0,wall};
Point(k+8) = {5*D, 3*D, 0,wall};
Point(k+9) = {0, 3*D, 0,wall};
Point(k+10) = {1.5, 0, 0, wall};
Point(k+11) = {3.5, 0, 0, wall};

Line(5) =  {k+11, k+07};
Line(6) =  {k+07, k+08};
Line(7) =  {k+08, k+09};
Line(8) =  {k+09, k+06};
Line(9) =  {k+06, k+10};
Line(10) = {k+10, k+11};

Physical Line('wallNoSlip') = {5, 6, 8, 9, 10};
Physical Line('wallOutflow') = {7};

j=200*0;
For t In {1:nb}
Physical Line(Sprintf("bubble%g",t)) = {j+1, j+2, j+3, j+4};
 j=200*t;
EndFor

Transfinite Line {10} = 30 Using Progression 1;
