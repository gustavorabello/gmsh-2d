// axisymmetric rising bubble using fixed frame
l1 = 0.03; // fine
l2 = 0.05;  // coarse

dist = 2.0; // distance between the center and bottom (left) boundary
twoD = 0.0;
D = 10.0;
l = 12;

/* Defining bubble shape (circle with diameter 1, cetered at origin): */
Point(1) = {  0.0, twoD, 0.0, l1}; // center
Point(2) = {  0.0, 0.5+twoD, 0.0, l1}; // up
Point(3) = {  0.5, twoD, 0.0, l1}; // right
Point(4) = { -0.5, twoD, 0.0, l1}; // left
Ellipse(1) = { 2, 1, 1, 3 };
Ellipse(2) = { 4, 1, 1, 2 };

k = newp;
/*  k+2                                   k+3
 *    o------------------------------------o
 *
 *
 *   k+1   4       3                      k+4
 *    o----o-------o-----------------------o
 */
Point(k+1) = {  -dist, twoD, 0.0, l2};
Point(k+2) = {  -dist, D/2.0+twoD, 0.0, l2};
Point(k+3) = { l-dist, D/2.0+twoD, 0.0, l2};
Point(k+4) = { l-dist, twoD, 0.0, l2};

top = newl; Line(top) = { k+2, k+3 };
bl = newl; Line(bl) = { 1, 4 };
br = newl; Line(br) = { 3, 1 };
left = newl; Line(left) = { 4, k+1 };
right = newl; Line(right) = { k+4, 3 };
in = newl; Line(in) = {k+1, k+2};
out = newl; Line(out) = {k+3, k+4};

/* Boundary conditions: */
Physical Line('wallNoSlip') = { top, in };
Physical Line('wallOutflow') = { out };
Physical Line('wallNormalV') = { bl, br, left, right };  // symmetry bc
Physical Line(Sprintf("bubble%g",1)) = {1, 2};
//+
