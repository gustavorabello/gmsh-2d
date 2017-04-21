// ellipse for pert > 0

l1 = 0.04; // fine
l2 = 0.04; // coarse
l = 5.0; // length of the domain

/* Defining bubble shape (half ellipse): */
D = 1.0;
r = D/2.0;

pert = (1.0/100)*r;

//  4                      4
// --- * Pi * a * b * c = --- * Pi * R^3 
//  3                      3
//
// a * b * c = R^3  --> considering b = c --> a * c^2 = R^3
//
//     R^3
// a = ---   ---> c = r + pert and a = r - pert
//     c^2
pertAxi = r-(r*r*r/((r+pert)*(r+pert)));


Point(1) = { 0.0, 0.0, 0.0, l1}; // center
Point(2) = { 0.0, r+pert, 0.0, l1}; // up
Point(3) = {   r-pertAxi, 0.0, 0.0, l1}; // right
Point(4) = {  -r+pertAxi, 0.0, 0.0, l1}; // left
Ellipse(1) = { 2, 1, 2, 3 };
Ellipse(2) = { 4, 1, 2, 2 };

k = newp;
/*                k+2
 *                 o
 *
 *
 *   k+1       4       3         k+3
 *    o--------o-------o----------o
 */
Point(k+1) = {-l/2,   0.0, 0.0, l2};
Point(k+2) = { 0.0, l/2.0, 0.0, l2};
Point(k+3) = { l/2,   0.0, 0.0, l2};

topL = newl; Ellipse(topL) = { k+1, 1, 1, k+2 };
topR = newl; Ellipse(topR) = { k+2, 1, 1, k+3 };
bl = newl; Line(bl) = { 1, 4 };
br = newl; Line(br) = { 3, 1 };
left = newl; Line(left) = { 4, k+1 };
right = newl; Line(right) = { k+3, 3 };

/* Boundary conditions: */
Physical Line(Sprintf("bubble%g",1)) = {1, 2};
Physical Line('wallNoSlipPressure') = { topL, topR };
Physical Line('wallNormalV') = { bl, br, left, right };  // symmetry bc

