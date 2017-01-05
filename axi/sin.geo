// Gmsh project created on Thu Jun  4 09:24:57 2009

nb = 1;
b1 = 0.04;
wall = 0.04;

D = 1.0;
r = 0.3*D;
body = 1.5*D;
slug = 0.7*r;

ll = 1.5*D; // length of the left section
dist = 0.5*r; // distance from the bubble to the left and right sections

For t In {0:nb-1}
 // bubble's coordinates
 xc = (ll+dist)+(slug+body+r+r/2.0)*t;
 yc = 0.0;
 zc = 0.0;

 // include torus.geo file
 Include '../bubbleShape/taylorAxi.geo';
EndFor


A = 0.05;
D = 0.5;
k = 1;
stretch=8;
phase = 0;
nCycles = 2;
nPoints = 40;
nTheta = 4;

k = 10000;
j = 1+k;
// top line
For i In {1:nPoints}
 X = stretch*( (i-1)/(nPoints-1) );
 Y = D + A*Sin(nCycles*2*Pi/stretch*X-phase);
 Point(j) = {X, Y, 0, wall};
 j = j + 1;
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
 *    |       ll       | r |     body   | r |       lr        |
 *    |<-------------->|<->|<---------->|<->|<--------------->|
 */

Point(k+1) = {0.0, 0.0, 0.0, wall};

Extrude {ll, 0, 0} {
  Point{k+1};
}

Point(k+3) = {(ll+dist)+body+2*r+dist,   0.0, 0.0, wall};

Extrude {stretch-(ll+body+2*r+r/2.0+dist), 0, 0} {
  Point{k+3};
}

bc = newl; Line(bc) = { 1, 4 };
br = newl; Line(br) = { 3, 1 };
bl = newl; Line(bl) = { 4, 6 };
left = newl; Line(left) = { 3, k+3 };
right = newl; Line(right) = {3, k+1};

in = newl; Line(in) = {k+1, k-nPoints};
out = newl; Line(out) = {k+4, k-1};


/*--------------------------------------------------
 * // lines in both ends
 * s1=newreg;
 * Line(s1) = {k+1, k+1+nPoints};
 * Line(s1+1) = {k+nPoints, k+2*nPoints};
 * --------------------------------------------------*/

//Physical Line('wallNoSlip') = {k-nPoints:k+(nPoints-2):1,in};
Physical Line('wallNoSlip') = {k-nPoints:k-2:1,in};
Physical Line('wallOutflow') = { out };
Physical Line('wallNormalV') = { -4, -6, bc, br, bl, left, right, -k };  // symmetry bc

j=200*0;
For t In {1:nb}
Physical Line(Sprintf("bubble%g",t)) = {j+6, j+2, j+1, j+5, j+4, j+3};
 j=200*t;
EndFor
 
