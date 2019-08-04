// axisymmetric bubble in microchannel

wall = 0.045; 
b1 = 0.03; 
nb = 1; 
 
D = 1.0; 
r = 0.4*D; 
body = 2*D; 
slug = 1.9*r; 
Xi = 0.0;
stretch = 8.0;

For t In {0:nb-1}
 // bubble's coordinates
 xc = Xi + 0.75*stretch-(slug+body+r+r/2.0)*t;
 yc = 0.0;
 zc = 0.0;

 // include torus.geo file
 Include '../../bubbleShape/taylorAxi.geo';
EndFor

k = newp;
/*  
 *   k+1                                                     k+2
 *    o--------------------------------------------------------|
 *    
 *   k+3                                                     k+4
 *    o----------------o----o-----------o----o-----------------|
 *    |      left      | bl |     bc    | br |       right     |
 *    |<-------------->|<-->|<--------->|<-->|<--------------->|
 */

Point(k+1) = {Xi + 0.0, D/2.0, 0.0, wall};
Point(k+2) = {Xi + stretch,   D/2.0, 0.0, wall};
Point(k+3) = {Xi + 0.0, 0.0, 0.0, wall};
Point(k+4) = {Xi + stretch,   0.0, 0.0, wall};
top = newl; Line(top) = { k+1, k+2 };
in = newl; Line(in) = {k+3,k+1 };
out = newl; Line(out) = {k+2, k+4};

// at symmetry axis, the nodes should be connected, since interface is
// also at the axis. It is not possible to have a straigth line
// connecting the extreme edges of the domain (k+1 to k+5)
j=100*0;
For t In {1:nb}
 bc = newl; Line(bc) = { j+1, j+4 };
 br = newl; Line(br) = { j+3, j+1 };
 bl = newl; Line(bl) = {j+4, j+6};

 j=100*t;
EndFor

right = newl; Line(right) = { j-100+11, 3 };
left = newl; Line(left) = { j-100+6, j-100+10 };

j=100*0;
For t In {1:nb-1}
 mid = newl; Line(mid) = {6+j, 103+j};

 j=100*t;
EndFor

/* Defining boundary conditions: */
//Physical Line('wallInflowZeroU') = { in,out,5, top, 7};
Physical Line('wallMovingYDiverg') = { top };
Physical Line('wallInflowZeroU') = { out };
Physical Line('wallOutflow') = { in };

//Physical Line('wallNormalV') = { -4, -6, bc, br, bl, left, right };  // symmetry bc
Physical Line('wallNormalV') = {7+100*(nb-1)*2:11+100*(nb-1)*2+4*(nb-1):1};


j=200*0;
For t In {1:nb}
Physical Line(Sprintf("bubble%g",t)) = {j+2, j+1,j+3};
 j=200*t;
EndFor
