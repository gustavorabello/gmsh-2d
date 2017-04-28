// 2d complete bubble (upper and lower half)
l1 = 0.03;
l2 = 0.1;

Printf("Quantitative benchmark computations of two-dimensional bubble dynamics, Int. J. for Num. Meth. in Fluids, vol. 60 pp. 1259-1288 (2008)");
D = 2.0;
l = 4.0;
dist = 1.0;
twoD = 0.0;

/* Defining bubble shape (circle with diameter 1, cetered at origin): */
Point(1) = {  0.0, twoD, 0.0, l1}; // center
Point(2) = {  0.0, 0.5+twoD, 0.0, l1}; // up
Point(3) = {  0.5, twoD, 0.0, l1}; // right
Point(4) = { -0.5, twoD, 0.0, l1}; // left
Point(5) = {  0.0, -0.5+twoD, 0.0, l1}; // up
Ellipse(1) = { 2, 1, 1, 3 };
Ellipse(2) = { 4, 1, 1, 2 };
Ellipse(3) = { 3, 1, 1, 5 };
Ellipse(4) = { 5, 1, 1, 4 };

k = newp;
Point(k+1) = {  -dist, -D/2.0+twoD, 0.0, l2};
Point(k+2) = {  -dist, D/2.0+twoD, 0.0, l2};
Point(k+3) = { l-dist, D/2.0+twoD, 0.0, l2};
Point(k+4) = { l-dist, -D/2.0+twoD, 0.0, l2};

top = newl; Line(top) = { k+2, k+3 };
bot = newl; Line(bot) = { k+4, k+1 };
in = newl; Line(in) = {k+1, k+2};
out = newl; Line(out) = {k+3, k+4};

/* Boundary conditions: */
Physical Line(Sprintf("bubble%g",1)) = {1, 2, 3, 4};
Printf("Slip walls");
//Physical Line('wallNoSlipPressure') = { in, out };
//Physical Line('wallNormalV') = { top, bot };  // symmetry bc
Physical Line('wallNoSlipP') = { in, out };
Physical Line('wallNormalY') = { top, bot };  // symmetry bc
