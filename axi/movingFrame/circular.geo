// axisymmetric rising bubble using fixed frame

l = 8;

nb = 1;
b1 = 0.03;
wall = 0.05;

D = 1.0;
r = 0.4*D; // bubble' radius 
pert = (0.0/100.0)*r;
slug = 1.0*D;
body = 2.0*D;

For t In {0:nb-1}
 // bubble's coordinates
 xc = 0.75*l-(slug+body+r+r/2.0)*t;
 yc = 0.0;
 zc = 0.0;

 Include '../../bubbleShape/taylorAxi.geo';
EndFor

k = newp;
/*  k+2                                   k+3
 *    o------------------------------------o
 *
 *
 *   k+1                   4       3      k+4
 *    o--------------------o-------o-------o
 */
Point(k+1) = { 0.0,   0.0, 0.0, b1};
Point(k+2) = { 0.0, D/2.0, 0.0, wall};
Point(k+3) = { l  , D/2.0, 0.0, wall};
Point(k+4) = { l  , 0.0, 0.0, wall};
//Point(k+4) = { l  , 0.0, 0.0, b1};

top = newl; Line(top) = { k+2, k+3 };
in = newl; Line(in) = {k+1, k+2};
out = newl; Line(out) = {k+3, k+4};

j=100*0;
For t In {1:nb}
 br = newl; Line(br) = { 3+j, 1+j };
 bm = newl; Line(bm) = { 1+j, 4+j };
 bl = newl; Line(bl) = { 4+j, 6+j };

 j=100*t;
EndFor

/* mid line between bubbles (bb) only with > 1 bubble */
j=100*0;
If (nb > 1)
 For t In {1:nb-1}
  bb = newl; Line(bb) = { 6+j, 103+j };
  j=100*t;
 EndFor
EndIf

right = newl; Line(right) = { k+4, 3 };
left = newl; Line(left) = { 6+j, k+1 };


/* Boundary conditions: */
Physical Line('wallInflowZeroU') = { top, out};
Physical Line('wallOutflow') = { in };

// symmetry bc
Physical Line('wallNormalV') = { 2*(nb-1)*100+7:2*(nb-1)*100+3*(nb+3):1 };  

j=200*0;
For t In {1:nb}
Physical Line(Sprintf("bubble%g",t)) = {j+1, j+2, j+3};
 j=200*t;
EndFor
//+
