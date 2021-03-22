// axisymmetric rising bubble using fixed frame
/*--------------------------------------------------
 * l1 = 0.1; // fine
 * l1o = 0.8; // outer region
 * l2 = 1.40;  // coarse
 * --------------------------------------------------*/

l1 = 0.03; // fine
l1o = 0.12; // outer region
l2 = 0.45;  // coarse

dist = 10.0; // distance between the center and bottom (left) boundary
twoD = 0.0;
D = 20.0;
l = 20;

/* Defining bubble shape (circle with diameter 1, cetered at origin): */
Point(1) = {  0.0, twoD, 0.0, l1}; // center
Point(2) = {  0.0, 0.5+twoD, 0.0, l1}; // up
Point(3) = {  0.5, twoD, 0.0, l1}; // right
Point(4) = { -0.5, twoD, 0.0, l1}; // left
Ellipse(1) = { 2, 1, 1, 3 };
Ellipse(2) = { 4, 1, 1, 2 };

/* Define refined region */
Point(5) = {-3.3, -0, 0, l1o};
Point(6) = {3.3, 0, 0, l1o};
Point(7) = {0, 3.3, 0, l1o};
Ellipse(3) = { 5, 1, 1, 7 };
Ellipse(4) = { 7, 1, 1, 6 };

k = newp;
/*  k+2                                   k+3
 *    o------------------------------------o
 *
 *
 *                      o 7                 
 *                                           
 *                      o 2
 *   k+1     5      4   1   3      6      k+4
 *    o------o------o---o---o------o-------o
 */
Point(k+1) = {  -dist, twoD, 0.0, l2};
Point(k+2) = {  -dist, D/2.0+twoD, 0.0, l2};
Point(k+3) = { l-dist, D/2.0+twoD, 0.0, l2};
Point(k+4) = { l-dist, twoD, 0.0, l2};

top = newl; Line(top) = { k+2, k+3 };
bl = newl; Line(bl) = { 1, 4 };
br = newl; Line(br) = { 3, 1 };
outl = newl; Line(outl) = { 4, 5 };
outr = newl; Line(outr) = { 3, 6 };
left = newl; Line(left) = { 5, k+1 };
right = newl; Line(right) = { k+4, 6 };
in = newl; Line(in) = {k+1, k+2};
out = newl; Line(out) = {k+3, k+4};

Curve Loop(1) = {6, 2, 1, 7};
Plane Surface(1) = {1};
Curve Loop(2) = {2, 1, 9, -4, -3, -8};
Plane Surface(2) = {2};
Curve Loop(3) = {10, 12, 5, 13, 11, -4, -3};
Plane Surface(3) = {3};

/* Boundary conditions: */
Physical Line('wallInflowZeroU') = {out,top};
Physical Line('wallOutflow') = { in };
Physical Line('wallNormalV') = { bl,br,outl,outr,left,right };  // symmetry bc
Physical Line(Sprintf("bubble%g",1)) = {1, 2};
//+
Physical Line('transition') = {3, 4};
//+
Physical Surface('regionInner') = {1};
Physical Surface('regionCenter') = {2};
Physical Surface('regionOuter') = {3};
