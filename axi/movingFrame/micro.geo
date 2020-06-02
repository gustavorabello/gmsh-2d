// axisymmetric bubble in microchannel

Case = 21; // microAxiSym (Sepideh's and Erik's PhD thesis)
wall = 0.02; 
b1 = 0.01; 
nb = 1; 
 
D = 1.0; 
r = 0.45*D; 
body = 1.5*D; 
If( Case == 6 ) // (air-glycerol microAxiSym)
 body = 1.075*D;
EndIf
If( Case == 7 ) // (air-glycerol microAxiSym)
 body = 1.268*D;
EndIf

If( Case > 15 ) // (air-water microAxiSym)
 body = 0.74*D;
EndIf
slug = 0.7*r;
pert = (0.0/100)*r;

For t In {0:nb-1}
 // bubble's coordinates
 xc = 1.8+(slug+body+r+r/2.0)*t;
 If( Case == 6 ) // (air-glycerol microAxiSym)
  xc = 1.4+(slug+body+r+r/2.0)*t;
 EndIf
 If( Case == 7 ) // (air-glycerol microAxiSym)
  xc = 1.6+(slug+body+r+r/2.0)*t;
 EndIf
 If( Case > 15 ) // (air-water microAxiSym)
  xc = 0.9+(slug+body+r+r/2.0)*t;
 EndIf
 yc = 0.0;
 zc = 0.0;

 // include file
 Include '../../bubbleShape/taylorAxi.geo';
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

If( Case > 15 ) // (air-water microAxiSym)
 Do = 514E-6; // channel diameter [m]
EndIf

If( Case < 15 ) // (air-water microAxiSym)
Do = 494E-6; // channel diameter [m]
EndIf

Printf("non-dim bubble volume V = %f [-]",(V1+V2+V3));
Printf("non-dim bubble equiv diameter deq^3 = %f [-]",((V1+V2+V3)*6/Pi)^(1/3));
Printf("bubble volume (channel D=%f [m]) V = %fE-12 [m^3]",Do,(V1+V2+V3)*Do*Do*Do*1e12);

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

Characteristic Length { k+3, k+4, k+5, k+6 } = wall;

/* Defining boundary conditions: */
Physical Line('wallInflowUParabolic3d') = { in,out };
Physical Line('wallNoSlipPressure') = { 5, top, 7};
Physical Line('wallNormalV') = { -4, -6, bc, br, bl, left, right };  // symmetry bc
Physical Line(Sprintf("bubble%g",1)) = {1, 2, 3};

