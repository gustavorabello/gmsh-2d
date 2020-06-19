// axisymmetric bubble in microchannel
D = 1.0; // channel diameter

wall = 0.08; 
b1 = 0.01; 

L1 = 10*D; // length of the right section
L2 = 3*D; // length of the right section
L3 = 3*D; // length of the right section

k = newp;
/*  k+2                             k+4         k+6        k+8
 *    o------------------------------o-----------o----------o
 *
 *
 *   k+1                            k+3         k+5        k+7
 *    o------------------------------o-----------o----------o
 */

Point(k+1) = {-L1,   0.0, 0.0, wall};
Point(k+2) = {-L1, D/2.0, 0.0, wall};

Point(k+3) = {0.0,   0.0, 0.0, wall};
Point(k+4) = {0.0, D/2.0, 0.0, wall};

Point(k+5) = {L2,   0.0, 0.0, wall};
Point(k+6) = {L2, D/2.0, 0.0, wall};

Point(k+7) = {L2+L3,   0.0, 0.0, wall};
Point(k+8) = {L2+L3, D/2.0, 0.0, wall};

/*--------------------------------------------------
 * Extrude {L2, 0, 0} {
 *   Point{k+3, k+4};
 * }
 * 
 * Extrude {L3, 0, 0} {
 *   Point{k+5, k+6};
 * }
 * --------------------------------------------------*/

topl = newl; Line(topl) = { k+2,k+4 };
topb = newl; Line(topb) = { k+4,k+6 };
topr = newl; Line(topr) = { k+6,k+8 };
in = newl; Line(in) = {k+1, k+2};
out = newl; Line(out) = {k+8, k+7};
bottomr = newl; Line(bottomr) = {k+7,k+5};
bottomb = newl; Line(bottomb) = {k+5,k+3};
bottoml = newl; Line(bottoml) = {k+3,k+1};

/* Defining boundary conditions: */
Physical Line('wallInflowUParabolic3d') = { in,out };
Physical Line('wallNoSlipPressure') = { topr,topb,topl };
Physical Line('wallNormalV') = { bottomr,bottomb,bottoml };  // symmetry bc

//+
//Point(20) = {0.115, 0, 0, 1.0};
//Point(21) = {0.115+3.9, 0, 0, 1.0};
//+
Transfinite Line {topb, bottomb} = 100 Using Progression 1;
