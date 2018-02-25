// sphere for axisymmetric static or oscillating drop simulation

b1 = 0.02; // fine
wall = 0.08; // coarse
A = 0.0; // circle perturbation

l = 5.0; // length of the domain

/* Defining bubble shape (half ellipse): */
r = 0.5;
Point(1) = { 0.0, 0.0, 0.0, b1}; // center
Point(2) = { 0.0, r+A, 0.0, b1}; // up
Point(3) = {   r, 0.0, 0.0, b1}; // right
Point(4) = {  -r, 0.0, 0.0, b1}; // left
Ellipse(1) = { 2, 1, 2, 3 };
Ellipse(2) = { 4, 1, 2, 2 };

k = newp;
/*  k+2                          k+3
 *    o---------------------------o
 *
 *
 *   k+1       4       3         k+4
 *    o--------o-------o----------o
 */
Point(k+1) = {-l/5,   0.0, 0.0, wall};
Point(k+2) = {-l/5, l/2.0, 0.0, wall};
Point(k+3) = { l/2, l/2.0, 0.0, wall};
Point(k+4) = { l/2,   0.0, 0.0, wall};

top = newl; Line(top) = { k+2, k+3 };
bl = newl; Line(bl) = { 1, 4 };
br = newl; Line(br) = { 3, 1 };
left = newl; Line(left) = { 4, k+1 };
right = newl; Line(right) = { k+4, 3 };
in = newl; Line(in) = {k+1, k+2};
out = newl; Line(out) = {k+3, k+4};

/* Boundary conditions: */
Physical Line(Sprintf("bubble%g",1)) = {1, 2};
Physical Line('wallNoSlip') = { top, in };
Physical Line('wallOutflow') = { out };
Physical Line('wallNormalV') = { bl, br, left, right };  // symmetry bc

Transfinite Line {4, 5} = 20 Using Progression 1;
