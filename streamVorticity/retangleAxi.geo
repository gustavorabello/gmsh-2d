/* square cavity */
wall = 0.025;

Point(1) = { 0.0, 0.5, 0.0, wall};
Point(2) = { 1.5, 0.5, 0.0, wall};
Point(3) = { 0.0, 0.0, 0.0, wall};
Point(4) = { 1.5, 0.0, 0.0, wall};

l = newl;
Line(l) = {1, 3};

b = newl;
Line(b) = {3, 4};

r = newl;
Line(r) = {4, 2};

t = newl;
Line(t) = {2, 1};

//Physical Line('wallNoSlipConst') = {t,b};
Physical Line('wallNoSlipAxi') = {t};
Physical Line('wallNormalV') = {b};
Physical Line('wallInflowUAxi') = {l};
Physical Line('wallOutflow') = {r};

//+
Curve Loop(1) = {4, 1, 2, 3};
Plane Surface(1) = {1};
Physical Surface('surface') = {1};
//Transfinite Surface {1};

// quad mesh
Recombine Surface{1};

// high order element
//Mesh.ElementOrder = 2;
//Mesh.SecondOrderIncomplete = 1;


