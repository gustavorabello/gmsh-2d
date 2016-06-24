// Gmsh project created on Thu Jun  4 09:24:57 2009

nb = 1;
b1 = 0.03;
wall = 0.03;

D = 1.0;
kappa = 0.92; // kappa = 0.54, 0.78, 0.92
r = kappa*D/2.0;
body = 1*D;
slug = 0.7*r;
pert = (0.0/100.0)*r;

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
phase = 0.0;
stretch=8;
nCycles = 2;
lambda = stretch/nCycles;
wavenum = 2*Pi/lambda; 
nPoints = 40; // total number of points in the sinusoidal line
nTheta = 4; // number of rotations

xc = 1.25*lambda;
yc = 0.0;
l1 = 0.04; // fine
l2 = 0.1;  // coarse
l = 6;
dist = 4.0;
twoD = 0.0;

/* Defining bubble shape (circle with diameter 1, cetered at origin): */
Point(1) = {     xc, twoD, 0.0, l1}; // center
Point(2) = {     xc, 0.5+twoD, 0.0, l1}; // up
Point(3) = { xc+0.5, twoD, 0.0, l1}; // right
Point(4) = { xc-0.5, twoD, 0.0, l1}; // left
Ellipse(1) = { 2, 1, 1, 3 };
Ellipse(2) = { 4, 1, 1, 2 };

k = newp;
/*  k+2                                   k+3
 *    o                                    o
 *
 *
 *   k+1   4       3                      k+4
 *    o----o-------o-----------------------o
 */
Point(k+1) = {   0.0, twoD, 0.0, l2};
Point(k+2) = { stretch, twoD, 0.0, l2};


k = newp;
j = 1+k;
// top line
For i In {1:nPoints}
 X = stretch*( (i-1)/(nPoints-1) );
 //Y = D/2.0 + A*Sin(nCycles*2*Pi/stretch*X-phase);
 Y = D/2.0 + A*Sin(wavenum*X-phase);
 Point(j) = {X, Y, 0, wall};
 j = j + 1;
EndFor

j = 1+k;
// lines
For i In {1:nPoints-1}
 Line(j) = {j, j+1};
 j = j + 1;
EndFor


/*--------------------------------------------------
 * //top = newl; Line(top) = { k+2, k+3 };
 * bl = newl; Line(bl) = { 6, 4 };
 * br = newl; Line(br) = { 3, 9 };
 * left = newl; Line(left) = { 6, 7 };
 * right = newl; Line(right) = { k+4, 3 };
 * in = newl; Line(in) = {k+1, k+2};
 * out = newl; Line(out) = {k+3, k+4};
 * --------------------------------------------------*/

left = newl; Line(left) = { 6, 4 };
right = newl; Line(right) = { 3, 7 };
bl = newl; Line(bl) = { 4, 1 };
br = newl; Line(br) = { 1, 3 };
left = newl; Line(left) = { 6, 9 };
right = newl; Line(right) = { 7, 48 };


/*--------------------------------------------------
 * // lines in both ends
 * s1=newreg;
 * Line(s1) = {k+1, k+1+nPoints};
 * Line(s1+1) = {k+nPoints, k+2*nPoints};
 * --------------------------------------------------*/

/*--------------------------------------------------
 * Physical Line('wallInflowZeroU') = {s1+1};
 * Physical Line('wallOutflow') = {s1};
 * Physical Line('wallMovingY') = {k+1:k+(nPoints-1)*2:1};
 * 
 * j=200*0;
 * For t In {1:nb}
 * Physical Line(Sprintf("bubble%g",t)) = {j+6, j+2, j+1, j+5, j+4, j+3};
 *  j=200*t;
 * EndFor
 * 
 * --------------------------------------------------*/
/*--------------------------------------------------
 * Point(10041) = {-1.6, -2661.9, 0, 1.0};
 * Point(10042) = {1, -0.8, 0, 1.0};
 * Point(10043) = {-12.8, -2679.7, 0, 1.0};
 * Point(10044) = {4, -0.8, 0, 1.0};
 * Point(10045) = {5.7, -0.9, 0, 1.0};
 * Point(10046) = {8, -0.9, 0, 1.0};
 * --------------------------------------------------*/
