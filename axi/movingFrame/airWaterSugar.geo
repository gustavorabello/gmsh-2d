// axisymmetric rising bubble using fixed frame

D = 10.0;
l = 12;

nb = 1;
b1 = 0.04;
wall = 0.04;

r = 0.5;
pert = (0.0/100.0)*r;
slug = 1.5;
body = 3.5;

For t In {0:nb-1}
 // bubble's coordinates
 xc = 0.75*l - (slug+2*r)*t;
 yc = 0.0;
 zc = 0.0;

 Include '../../bubbleShape/sphereAxi.geo';
EndFor

k = newp;
/*  k+2                                   k+3
 *    o------------------------------------o
 *
 *
 *   k+1                   4       3      k+4
 *    o--------------------o-------o-------o
 */
Point(k+1) = { 0.0,   0.0, 0.0, wall};
Point(k+2) = { 0.0, D/2.0, 0.0, wall};
Point(k+3) = { l  , D/2.0, 0.0, wall};
Point(k+4) = { l  , 0.0, 0.0, wall};

top = newl; Line(top) = { k+2, k+3 };
in = newl; Line(in) = {k+1, k+2};
out = newl; Line(out) = {k+3, k+4};

j=100*0;
For t In {1:nb}
 br = newl; Line(br) = { 3+j, 1+j };
 bl = newl; Line(bl) = { 1+j, 4+j };

 j=100*t;
EndFor

/* mid line (bm) only between bubbles */
j=100*0;
If (nb > 1)
 For t In {1:nb-1}
  bm = newl; Line(bm) = { 4+j, 103+j };
  j=100*t;
 EndFor
EndIf

right = newl; Line(right) = { k+4, 3 };
left = newl; Line(left) = { 4+j, k+1 };


/* Boundary conditions: */
Physical Line('wallInflowZeroU') = { top, out};
Physical Line('wallOutflow') = { in };

// symmetry bc
Physical Line('wallNormalV') = { 2*(nb-1)*100+6:2*(nb-1)*100+3*(nb+2):1 };  

j=200*0;
For t In {1:nb}
Physical Line(Sprintf("bubble%g",t)) = {j+1, -1*(j+2)};
 j=200*t;
EndFor
