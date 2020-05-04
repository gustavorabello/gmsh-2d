// Gmsh project created on Fri Feb  6 14:28:22 2009

nb = 1;
b1 = 0.09;
wall = 0.4;

D = 1.0;
r = 0.5*D;
body = 1.0*D;
slug = 0.7*r;
pert = (0.0/100)*r;

For t In {0:nb-1}
 // bubble's coordinates
 xc = 0.0+(slug+body+r+r/2.0)*t;
 yc = 0.0;

 // include torus.geo file
 Include './circle.geo';
EndFor

j=200*0;
For t In {1:nb}
Physical Line(Sprintf("bubble%g",t)) = {j+1, j+2, j+3, j+4};
 j=200*t;
EndFor

