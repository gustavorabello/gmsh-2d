
b1 = 0.12;
nb = 1;

D = 1.0;
r = 0.5*D;
pert = (0.0/100)*r;

For t In {0:nb-1}
 // bubble's coordinates
 xc = 0.0;
 yc = 0.0;

 // include torus.geo file
 Include '../../bubbleShape/square.geo';
EndFor

// high order element
Mesh.ElementOrder = 2;

j=200*0;
For t In {1:nb}
Physical Line(Sprintf("bubble%g",t)) = {j+1, j+2, j+3, j+4};
 j=200*t;
EndFor
