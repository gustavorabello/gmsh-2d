
r = 0.5;
pert = 0.0*r;
lc = 0.1;
//+
Point(1) = {0, 0, 0, lc};
Point(2) = {0, +r+pert, 0, lc};
Point(3) = {+r+pert, 0, 0, lc};
Point(4) = {0, -r-pert, 0, lc};
Point(5) = {-r-pert, 0, 0, lc};

//+
Ellipse(1) = {2, 1, 1, 3};
Ellipse(2) = {3, 1, 1, 4};
Ellipse(3) = {4, 1, 1, 5};
Ellipse(4) = {5, 1, 1, 2};
Line Loop(1) = {4, 1, 2, 3};
Plane Surface(1) = {1};

//+
Physical Line('wallZero') = {1, 2, 3, 4};

//+
Physical Surface(2) = {1};
