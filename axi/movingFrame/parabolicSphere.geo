// Gmsh project created on Thu Jun  4 09:24:57 2009

nb = 1;
b1 = 0.08;
wall = 0.2;

// bubble geometry
D = 2.0;
r = 0.5*D;
slug = 1.5*D;
pert = (0.0/100.0)*r;

ll = 1.5*D; // length of the left section
dist = 1.0*r; // distance from the bubble to the left and right sections

/* sinusoidal wall configuration
 *
 *                      2*pi
 * Eq.: y(x) = A sin( -------- * X - phase)
 *                     lambda
 *
 * A = amplitude
 * lambda = wavelength (channel length / number of corrugations )
 * X = x coordinate
 * phase = phase displacement
 *
 *       2*pi
 * k = -------- --> wave number
 *      lambda
 * */
A = 0.05;
Dthroat = 1.0;
stretch = 15;
stfixed = 20.0;     // stretch of the fixed sinSphere.geo
xcf = 0.15*stfixed; // xc of the fixed sinSphere.geo
xcm = -stretch/2.0 + 0.6*stretch; // xc of the moving sinSphere.geo (current)
phase = 10.0;
nPoints = (40.0/stfixed)*stretch+1; // total number of points in sinusoidal line
Printf("nPoints: ",nPoints);
Printf("----------- Shoud be included in femSIM2d ----------");
Printf("-------------- Simulator2D:setALEBC() --------------");
Printf("  A: %f",A);
Printf("  phase: %f",phase);
Printf("  Y: %f",Dthroat/2.0 + A*(phase)*(phase));
Printf("----------------------------------------------------");

For t In {0:nb-1}
 // bubble's coordinates
 xc = xcm + (slug+r)*t;
 //xc = xcm + r/2.0+1.5*D + (slug+r)*t;
 yc = 0.0;
 zc = 0.0;

 // include torus.geo file
 Include '../../bubbleShape/sphereAxi.geo';
EndFor

k = 10000;
j = 1+k;
// top line
For i In {1:nPoints}
 X = stretch*( (i-1)/(nPoints-1) )-stretch/2.0;
 Y = Dthroat/2.0 + A*(X-phase)*(X-phase);
 Point(j) = {X, Y, 0, wall};
 j = j + 1;
 Printf("X: %f, Y: %f",X,Y);
EndFor
Printf("xc: %f, y: %f",xc,Dthroat/2.0 + A*(X-phase)*(X-phase));

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

Point(k+1) = {-stretch/2.0, 0.0, 0.0, wall};
Point(k+2) = { stretch/2.0, 0.0, 0.0, wall};

// at symmetry axis, the nodes should be connected, since interface is
// also at the axis. It is not possible to have a straigth line
// connecting the extreme edges of the domain (k+1 to k+5)
bl = newl; Line(bl) = { 1, 4 };
br = newl; Line(br) = { 3, 1 };
right = newl; Line(right) = { 10000+nPoints+3,3 };
left = newl; Line(left) = {4, 10000+nPoints+2};
in = newl; Line(in) = {k+1, k-nPoints};
out = newl; Line(out) = {k+2, k-1};

Physical Line('wallInflowZeroU') = {-out};
Physical Line('wallMovingYNozzle') = {k-nPoints:k-2:1};
Physical Line('wallOutflow') = { in };
Physical Line('wallNormalV') = { left, bl, br, right };  // symmetry bc

j=200*0;
For t In {1:nb}
Physical Line(Sprintf("bubble%g",t)) = {j+1, -1*(j+2)};
 j=200*t;
EndFor
