// Gmsh project created on Thu Jun  4 09:24:57 2009

nb = 1;
b1 = 0.08;
wall = 0.08;

// bubble geometry
D = 2.5;
r = 0.5*D;
slug = 1.0*D;
pert = (0.0/100.0)*r;

ll = 1.5*D; // length of the left section
dist = 1.0*r; // distance from the bubble to the left and right sections

stretch = 15+(nb-1)*5;
phase = 0.0;
Xth = 5.0; // X position of throat
Xi  = -15.0-(nb-1)*5; // X inicial
xcf = -5.5; // bubble center position
nPoints = 40+1; // total number of points in the sinusoidal line
Printf("nPoints: ",nPoints);
Printf("----------- Shoud be included in femSIM2d ----------");
Printf("-------------- Simulator2D:setALEBC() --------------");
Printf("  No need to take any further action ---------------");
Printf("  No need to take any further action ---------------");
Printf("----------------------------------------------------");

For t In {0:nb-1}
 // bubble's coordinates
 xc = xcf - (slug+2*r)*t;
 //xc = 0.15*stretch + r/2.0+1.5*D +(slug+r)*t;
 yc = 0.0;
 zc = 0.0;

 // include torus.geo file
 Include '../../bubbleShape/sphereAxi.geo';
EndFor

k = 10000;
j = 1+k;
// top line
For i In {1:nPoints}
 X = Xi + stretch*( (i-1)/(nPoints-1) );
 If( X < 0.0 )
  Y = 2.0; 
 EndIf
 If( X <= Xth && X >= 0.0)
  //Y = 2.0 + 3.0*(((X-phase)/Xth) - 1.5)*((X-phase)/Xth)*((X-phase)/Xth);
  Y = 2.0 + 2.5*(((X-phase)/Xth) - 1.5)*((X-phase)/Xth)*((X-phase)/Xth);
  //Y = 2.0 + 2.0*(((X-phase)/Xth) - 1.5)*((X-phase)/Xth)*((X-phase)/Xth);
 EndIf
 If( X > Xth && X <= 10.0)
  //Y = 3.00 - (X/Xth)*(6.0-4.5*(X/Xth)+(X/Xth)*(X/Xth));
  Y = 3.25 - (X/Xth)*(6.0-4.5*(X/Xth)+(X/Xth)*(X/Xth));
  //Y = 3.50 - (X/Xth)*(6.0-4.5*(X/Xth)+(X/Xth)*(X/Xth));
 EndIf
 If( X > 10.0 )
  Y = 1.0; 
 EndIf
 
 Point(j) = {X, Y, 0, wall};
 j = j + 1;
 Printf("X: %f, Y: %f",X,Y);
EndFor


j = 1+k;
// lines
For i In {1:nPoints-1}
 Line(j) = {j, j+1};
 j = j + 1;
EndFor

k = newp;
/*  
 *   k+1             k+2  6           3  k+3               k+5
 *    o----------------o---o------------o---o-----------------o
 *    
 *    |           ll          | r | r |           lr          |
 *    |<--------------------->|<->|<->|<--------------------->|
 *    |                        stretch                        |
 *    |<----------------------------------------------------->|
 */

Point(k+1) = {Xi + 0.0, 0.0, 0.0, wall};
Point(k+2) = {Xi + stretch,   0.0, 0.0, wall};


// at symmetry axis, the nodes should be connected, since interface is
// also at the axis. It is not possible to have a straigth line
// connecting the extreme edges of the domain (k+1 to k+5)
j=100*0;
For t In {1:nb}
 bl = newl; Line(bl) = { j+1, j+4 };
 br = newl; Line(br) = { j+3, j+1 };

 j=100*t;
EndFor

right = newl; Line(right) = { 10000+nPoints+3,3 };
j=100*0;
For t In {1:nb-1}
 mid = newl; Line(mid) = {4+j, 103+j};

 j=100*t;
EndFor
left = newl; Line(left) = {4+j, 10000+nPoints+2};

in = newl; Line(in) = {k+1, k-nPoints};
out = newl; Line(out) = {k+2, k-1};

Physical Line('wallInflowZeroU') = {-out};
Physical Line('wallMovingYNozzle') = {k-nPoints:k-2:1};
Physical Line('wallOutflow') = { in };
Physical Line('wallNormalV') = {10041:10044+(nb-1)*3:1};


j=200*0;
For t In {1:nb}
Physical Line(Sprintf("bubble%g",t)) = {j+1, -1*(j+2)};
 j=200*t;
EndFor
