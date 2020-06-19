// axisymmetric bubble in microchannel

wall = 0.04; 
b1 = 0.02; 
nb = 1; 
 
D = 1.0; 
r = 0.35*D; 
body = 1.5*D; 
slug = 0.7*r; 

For t In {0:nb-1}
 // bubble's coordinates
 xc = 1.8+(slug+body+r+r/2.0)*t;
 yc = 0.0;
 zc = 0.0;

 // include torus.geo file
 Include '../../bubbleShape/taylorAxi.geo';
EndFor

ll = 6.5*D; // length of the left section
lr = 1.5*D; // length of the right section

dist = 0.5*r; // distance from the bubble to the left and right sections

k = newp;
/*  k+2              k+4                 k+6               k+8
 *    o----------------o------------------o-----------------o
 *
 *
 *   k+1             k+3  6           3  k+5               k+7
 *    o----------------o--o------------o--o-----------------o
 */

Point(k+1) = {-(ll+dist),   0.0, 0.0, wall};
Point(k+2) = {-(ll+dist), D/2.0, 0.0, wall};

Extrude {ll, 0, 0} {
  Point{k+1, k+2};
}

Point(k+5) = {body+2*r+dist,   0.0, 0.0, wall};
Point(k+6) = {body+2*r+dist, D/2.0, 0.0, wall};

Extrude {lr, 0, 0} {
  Point{k+5, k+6};
}

top = newl; Line(top) = { k+4, k+6 };

bc = newl; Line(bc) = { 1, 4 };
br = newl; Line(br) = { 3, 1 };
bl = newl; Line(bl) = { 4, 6 };
left = newl; Line(left) = { 6, k+3 };
right = newl; Line(right) = { k+5, 3 };


in = newl; Line(in) = {k+1, k+2};
out = newl; Line(out) = {k+8, k+7};

Characteristic Length { k+3, k+5 } = wall;
Characteristic Length { k+4, k+6 } = b1;

/* Defining boundary conditions: */
Physical Line('wallOutflow') = { in };
Physical Line('wallInflowZeroU') = { out, 5, top, 7};
Physical Line('wallNormalV') = { -4, -6, bc, br, bl, left, right };  // symmetry bc


