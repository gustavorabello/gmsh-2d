// axisymmetric bubble in microchannel
D = 1.0; // channel diameter

/* Case 17: */
wall = 0.08; 
b1 = 0.005; 

L = 18*D; // length of the right section

k = newp;
/*  k+2                                                    k+4
 *    o-----------------------------------------------------o
 *
 *
 *   k+1                                                   k+3
 *    o-----------------------------------------------------o
 */

Point(k+1) = {-0.65,   0.0, 0.0, wall};
Point(k+2) = {-0.65, D/2.0, 0.0, wall};

Extrude {L, 0, 0} {
  Point{k+1, k+2};
}

top = newl; Line(top) = { k+2, k+4 };
in = newl; Line(in) = {k+1, k+2};
out = newl; Line(out) = {k+4, k+3};
bottom = newl; Line(bottom) = {k+3, k+1};

Characteristic Length { k+2, k+4 } = b1/1.3;

/* Defining boundary conditions: */
Physical Line('wallInflowUParabolic3d') = { in };
Physical Line('wallOutflow') = { out };
Physical Line('wallNoSlip') = { top };
Physical Line('wallNormalV') = { bottom };  // symmetry bc

