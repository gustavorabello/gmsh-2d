// Gmsh project created on Fri Feb  6 14:28:22 2009

nb = 1;
b1 = 0.06;
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
 Include '../../bubbleShape/circle.geo';
EndFor

k=10000;
Point(k+6) = {0, 0, 0,wall};
Point(k+7) = {4*D, 0, 0,wall};
Point(k+8) = {4*D, 4*D, 0,wall};
Point(k+9) = {0, 4*D, 0,wall};

Line(k+5) = {k+9, k+8};
Line(k+6) = {k+8, k+7};
Line(k+7) = {k+7, k+6};
Line(k+8) = {k+6, k+9};

/*--------------------------------------------------
 * Periodic Line {k+6} = {k+8};
 * Physical Line('wallOutflow') = {k+7};
 * Physical Line('wallInflowZeroV') = {k+5};
 * Physical Line('wallRight') = {k+6};
 * Physical Line('wallLeft') = {k+8};
 * --------------------------------------------------*/

/*--------------------------------------------------
 * Periodic Line {k+6} = {k+8};
 * Physical Line('wallInflowZeroU') = {k+5,k+7};
 * Physical Line('wallRight') = {k+6};
 * Physical Line('wallLeft') = {k+8};
 * --------------------------------------------------*/

Periodic Line {k+5} = {k+7};
Physical Line('wallRight') = {k+7};
Physical Line('wallLeft') = {k+5};
Physical Line('wallInflowZeroVPressure') = {k+6,k+8};

j=200*0;
For t In {1:nb}
Physical Line(Sprintf("bubble%g",t)) = {j+1, j+2, j+3, j+4};
 j=200*t;
EndFor

