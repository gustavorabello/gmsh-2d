// axisymmetric bubble in microchannel

Case = 17; // microAxiSym (Sepideh's and Erik's PhD thesis)
wall = 0.08; 
b1 = 0.005; 
nb = 1; 
 
D = 1.0; 
r = 0.42*D; 
body = 1.7*D; 

If( Case == 13 ) // (air-glycerol microAxiSym)
 r = 0.35*D; 
 body = 3.90*D;
EndIf
If( Case == 14 ) // (air-glycerol microAxiSym)
 r = 0.35*D; 
 body = 1.94*D;
EndIf
If( Case == 15 ) // (air-glycerol microAxiSym)
 r = 0.35*D; 
 body = 1.99*D;
EndIf
If( Case == 16 ) // (air-glycerol microAxiSym)
 r = 0.35*D; 
 body = 2.306*D;
EndIf
If( Case == 17 ) // (air-glycerol microAxiSym)
 r = 0.35*D; 
 body = 1.334*D;
EndIf
If( Case == 18 ) // (air-water microAxiSym)
 r = 0.42*D; 
 body = 1.906*D;
EndIf
If( Case == 19 ) // (air-water microAxiSym)
 r = 0.42*D; 
 body = 1.862*D;
EndIf
If( Case == 20 ) // (air-water microAxiSym)
 r = 0.42*D; 
 body = 2.51*D;
EndIf
If( Case == 21 ) // (air-water microAxiSym)
 r = 0.42*D; 
 body = 2.082*D;
EndIf
If( Case == 22 ) // (air-water microAxiSym)
 r = 0.42*D; 
 body = 2.475*D;
EndIf
slug = 0.7*r;
pert = (0.0/100)*r;

For t In {0:nb-1}
 // bubble's coordinates
 xc = 1.8+(slug+body+r+r/2.0)*t;
 If( Case == 13 ) // (air-glycerol microAxiSym)
  xc = 4.1+(slug+body+r+r/2.0)*t;
 EndIf
 If( Case == 14 ) // (air-glycerol microAxiSym)
  xc = 2.1+(slug+body+r+r/2.0)*t;
 EndIf
 If( Case == 15 ) // (air-glycerol microAxiSym)
  xc = 2.2+(slug+body+r+r/2.0)*t;
 EndIf
 If( Case == 16 ) // (air-glycerol microAxiSym)
  xc = 2.6+(slug+body+r+r/2.0)*t;
 EndIf
 If( Case == 17 ) // (air-glycerol microAxiSym)
  xc = 1.6+(slug+body+r+r/2.0)*t;
 EndIf
 If( Case == 18 ) // (air-water microAxiSym)
  xc = 2.25+(slug+body+r+r/2.0)*t;
 EndIf
 If( Case == 19 ) // (air-water microAxiSym)
  xc = 2.1+(slug+body+r+r/2.0)*t;
 EndIf
 If( Case == 20 ) // (air-water microAxiSym)
  xc = 2.9+(slug+body+r+r/2.0)*t;
 EndIf
 If( Case == 21 ) // (air-water microAxiSym)
  xc = 2.4+(slug+body+r+r/2.0)*t;
 EndIf
 If( Case == 22 ) // (air-water microAxiSym)
  xc = 2.8+(slug+body+r+r/2.0)*t;
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

If( Case > 17 ) // (air-water microAxiSym)
 Do = 514E-6; // channel diameter [m]
EndIf

If( Case < 18 ) // (air-water microAxiSym)
Do = 494E-6; // channel diameter [m]
EndIf

Printf("case = %g ",Case);
Printf("non-dim bubble volume V = %f [-]",(V1+V2+V3));
Printf("non-dim bubble equiv diameter deq^3 = %f [-]",((V1+V2+V3)*6/Pi)^(1/3));
Printf("bubble volume (channel D=%f [m]) V = %fE-12 [m^3]",Do,(V1+V2+V3)*Do*Do*Do*1e12);
Printf("bubble volume (channel D=%f [m]) V = %f [micro l]",Do,(V1+V2+V3)*Do*Do*Do*1e9);

ll = 6.5*D; // length of the left section
lr = 2.5*D; // length of the right section

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

Printf("k+4 %f",k+4);
Printf("k+6 %f",k+6);
Characteristic Length { k+4, k+6 } = b1/1.3;

/* Defining boundary conditions: */
Physical Line('wallInflowUParabolic3d') = { in,out };
Physical Line('wallNoSlipPressure') = { 5, top, 7};
Physical Line('wallNormalV') = { -4, -6, bc, br, bl, left, right };//sym bc
Physical Line(Sprintf("bubble%g",1)) = {1, 2, 3};

//Transfinite Line {8} = 220 Using Progression 1;
Transfinite Line {12, 11} = 8 Using Progression 1;
Transfinite Line {9} = 60 Using Progression 1;
Transfinite Line {10, 13} = 10 Using Progression 1;
