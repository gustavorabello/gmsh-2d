/* unbounded flow past sphere */

l1 = 0.2; // fine
l2 = 6.0; // coarse

r = 1.0; // sphere radius
D = 600.0*r; // channel diameter
front = 300.0*r;
back = 300.0*r;

// sphere centered at (0, 0):
Point(1) = {0.0, 0.0, 0.0}; // center
Point(2) = {-r, 0.0, 0.0, l1}; // left
Point(3) = {0.0, r, 0.0, l1}; // up
Point(4) = {r, 0.0, 0.0, l1}; // right

Ellipse(1) = { 4, 1, 1, 3 };
Ellipse(2) = { 3, 1, 1, 2 };

k = newp;
/*   k+5                                                   k+6
 *    o-----------------------------------------------------o
 *
 *
 *   k+3             k+1     2      4     k+2               k+4
 *    o----------------o----o        o----o-----------------o
 */

Point(k+1) = { -70.0*r, 0.0, 0.0, l2};
Point(k+2) = { 70.0*r, 0.0, 0.0, l2};
Point(k+3) = {-front, 0.0, 0.0, l2};
Point(k+4) = {back, 0.0, 0.0, l2};
Point(k+5) = {-front, D/2.0, 0.0, l2};
Point(k+6) = {back, D/2.0, 0.0, l2};

top = newl; Line(top) = { k+5, k+6 };
frBot = newl;  Line(frBot) = { k+1, k+3 };
baBot = newl; Line(baBot) = { k+4, k+2 };
left = newl; Line(left) = { 2, k+1 };
right = newl; Line(right) = { k+2, 4 };
in = newl; Line(in) = { k+3, k+5 };
out = newl; Line(out) = { k+6, k+4 };

// boundary conditions:
Physical Line('wallInflowU') = { in };
// The best way is to use outflow condition on top wall!!!
Physical Line('wallOutflow') = { out, top  };
Physical Line('wallNoSlipConcentration') = { 1, 2 };
Physical Line('wallNormalY') = { left, right, frBot, baBot }; // symmetry bc

