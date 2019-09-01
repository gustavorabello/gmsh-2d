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
A = 0.07;
stretch = 15;
lambda = 4;
wavenum = 2*Pi/lambda; 
xcf = 0.70*8-2;
phase = wavenum*(0.7*8.0-0.15*10.0-2);
nCycles = stretch/lambda;
nPoints = 60+1; // total number of points in the sinusoidal line
Printf("nPoints: ",nPoints);
Printf("-------------- Simulator2D:setALEBC() --------------");
Printf("  phase: %f",phase);
Printf("  Y: %f",D/2.0 + A*Sin(wavenum*xcf-phase));
Printf("  wavelength: %f",lambda);
Printf("----------------------------------------------------");

For t In {0:nb-1}
 // bubble's coordinates
 xc = xcf +(slug+r)*t;
 yc = 0.0;
 zc = 0.0;

 // include torus.geo file
 Include '../bubbleShape/taylorAxi.geo';
EndFor

k = 10000;
j = 1+k;
// top line
For i In {1:nPoints}
 X = stretch*( (i-1)/(nPoints-1) );
 Y = D/2.0 + A*Sin(wavenum*X-phase);
 Point(j) = {X, Y, 0, wall};
 j = j + 1;
 Printf("X: %f, Y: %f",X,Y);
EndFor
Printf("xc: %f, y: %f",xc,D/2.0 + A*Sin(wavenum*xc-phase));

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
 *    |     left       | bl|     body   | br|     right       |
 *    |<-------------->|<->|<---------->|<->|<--------------->|
 */

Point(k+1) = {0.0, 0.0, 0.0, wall};
Point(k+2) = {stretch, 0.0, 0.0, wall};

bc = newl; Line(bc) = { 1, 4 };
br = newl; Line(br) = { 3, 1 };
bl = newl; Line(bl) = { 4, 6 };
left = newl; Line(left) = { 6, k+1 };
right = newl; Line(right) = {k+2,3};
in = newl; Line(in) = {k+1, k-nPoints};
out = newl; Line(out) = {k-1, k+2};

Physical Line('wallNoSlip') = {k-nPoints:k-2:1,in};
Physical Line('wallOutflow') = {out };
Physical Line('wallNormalV') = {left,bl,bc,br,right};// symmetry bc

j=200*0;
For t In {1:nb}
Physical Line(Sprintf("bubble%g",t)) = {j+6, j+2, j+1, j+5, j+4, j+3};
 j=200*t;
EndFor
