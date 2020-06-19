// Gmsh project created on Fri Feb  6 14:28:22 2009

Case = 22; // microAxiSym (Sepideh's and Erik's PhD thesis)
nb = 1;
b1 = 0.02;

D = 1.0;
r = 0.42*D;
body = 1.5*D; 

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

 // include torus.geo file
 Include './taylorAxi.geo';
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

Printf("case = %g ",Case);
Printf("non-dim bubble volume V = %f [-]",(V1+V2+V3));
Printf("non-dim bubble equiv diameter deq^3 = %f [-]",((V1+V2+V3)*6/Pi)^(1/3));
Printf("bubble volume (channel D=%f [m]) V = %fE-12 [m^3]",Do,(V1+V2+V3)*Do*Do*Do*1e12);
Printf("bubble volume (channel D=%f [m]) V = %f [micro l]",Do,(V1+V2+V3)*Do*Do*Do*1e9);

j=200*0;
For t In {1:nb}
Physical Line(Sprintf("bubble%g",t)) = {j+1, j+2,j+3};
 j=200*t;
EndFor

