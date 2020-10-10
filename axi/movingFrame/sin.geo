// Gmsh project created on Thu Jun  4 09:24:57 2009

nb = 1;
b1 = 0.025;
wall = 0.025;

D = 1.0;
r = 0.25*D;
slug = 2.5*D;
body = 2.0*D;

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
stretch = 8;
lambda = 4;
wavenum = 2*Pi/lambda; 
stfixed = 8.0;     // stretch of the fixed sinSphere.geo
xcf = 0.15*stfixed; // xc of the fixed sin.geo
xcm = 0.75*stretch; // xc of the moving sin.geo (current)
phase = wavenum*(xcm-xcf); 
nCycles = stretch/lambda;
nPoints = (40.0/stfixed)*stretch+1; // total number of points in sinusoidal line
Printf("nPoints: ",nPoints);
Printf("----------- Shoud be included in femSIM2d ----------");
Printf("-------------- Simulator2D:setALEBC() --------------");
Printf("  A: %f",A);
Printf("  phase: %f",phase);
Printf("  Y: %f",D/2.0 + A*Sin(wavenum*xcm-phase));
Printf("  wavelength: %f",lambda);
Printf("----------------------------------------------------");

For t In {0:nb-1}
 // bubble's coordinates
 xc = xcm + (slug+r)*t;
 yc = 0.0;
 zc = 0.0;

 // include torus.geo file
 Include '../../bubbleShape/taylorAxi.geo';
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

/*  
 *   k+1              6    4            1   3               k+2
 *    o----------------o---o------------o---o-----------------o
 *    
 *    |       ll       | r |     body   | r |       lr        |
 *    |<-------------->|<->|<---------->|<->|<--------------->|
 */

k = k + nPoints;
Point(k+1) = {0.0, 0.0, 0.0, wall};
Point(k+2) = {stretch, 0.0, 0.0, wall};

left = newl; Line(left) = { 6, k+1 };
j=100*0;
For t In {1:nb}
 bl = newl; Line(bl) = { j+4, j+6 };
 bc = newl; Line(bc) = { j+1, j+4 };
 br = newl; Line(br) = { j+3, j+1 };
 j=100*t;
EndFor
j=100*0;
For t In {1:nb-1}
 Printf("j+3: %f",j+3);
 bm = newl; Line(bm) = { j+100+6,j+3 };
 j=100*t;
EndFor
right = newl; Line(right) = { j+3, k+2 };


// lines in both ends
out = newl;Line(out) = {k+1, k-nPoints+1};
in = newl;Line(in) = {k+2, k+0};

Physical Line('wallInflowZeroU') = {-in};
Physical Line('wallOutflow') = {out};
Physical Line('wallMovingY') = {k-nPoints+1:k-1:1};
Physical Line('wallNormalV') = {left,k+1:br+nb-1:1,-right};

j=200*0;
For t In {1:nb}
 Physical Line(Sprintf("bubble%g",t)) = {j+2, j+1,j+3};
 j=200*t;
EndFor
/*--------------------------------------------------
 * Printf("k+1: %f",k+1);
 * Printf("k+2: %f",k+2);
 * Printf("k+3: %f",k+3);
 * Printf("k+4: %f",k+4);
 * --------------------------------------------------*/

