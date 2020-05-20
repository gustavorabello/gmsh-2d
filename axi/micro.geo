// axisymmetric bubble in microchannel

wall = 0.04; 
b1 = 0.02; 
nb = 1; 
 
D = 1.0; 
r = 0.35*D; 
// case 6
//body = 1.212*D;
// case 7
body = 1.937*D; 
slug = 0.7*r; 

For t In {0:nb-1}
 // bubble's coordinates
 // case 6
 //xc = 1.7+(slug+body+r+r/2.0)*t;
 // case 7
 xc = 2.2+(slug+body+r+r/2.0)*t;
 yc = 0.0;
 zc = 0.0;

 // include torus.geo file
 Include '../bubbleShape/taylorAxi.geo';
EndFor

// Computing bubble volume 
// prolate ellipsoid --> V1 = 4/3 * Pi * a * b * b
a = r/2.0;
b = r;
V1 = (4.0/3.0)*Pi*a*b*b/2.0;

// conical frustum section --> V2 
r1 = r;
r2 = r;
h  = body;
V2 = (1.0/3.0)*Pi*h*(r1*r1 + r1*r2 + r2*r2);

// prolate ellipsoid --> V3 = 4/3 * Pi * a * b * b
a = r;
b = r;
V3 = (4.0/3.0)*Pi*a*b*b/2.0;

Do = 494E-6; // channel diameter [m]
Printf("non-dim bubble volume V = %f [-]",(V1+V2+V3));
Printf("non-dim bubble equiv diameter deq^3 = %f [-]",(V1+V2+V3)*6/Pi);
Printf("bubble volume (channel D=%f [m]) V = %fE-12 [m^3]",Do,(V1+V2+V3)*Do*Do*Do*1e12);

ll = 1.5*D; // length of the left section
lr = 6.5*D; // length of the right section

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

Characteristic Length { k+3, k+4, k+5, k+6 } = wall;

/* Defining boundary conditions: */
Physical Line('wallInflowUParabolic3d') = { in };
Physical Line('wallOutflow') = { out };
Physical Line('wallNoSlip') = { 5, top, 7};
Physical Line('wallNormalV') = { -4, -6, bc, br, bl, left, right };  // symmetry bc
Physical Line(Sprintf("bubble%g",1)) = {1, 2, 3};

