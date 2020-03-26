/* retangle */
wall = 0.03;
hole = 0.01;
L = 1.0;

xCenter = 1.5*L; 
yCenter = L/2;
radius=0.1;
pert=(0.0/100)*radius;
Point(1) = {xCenter, yCenter, 0,hole}; // center
Point(2) = {xCenter, yCenter+radius-pert, 0,hole}; // up
Point(3) = {xCenter, yCenter-radius+pert, 0,hole}; // down
Point(4) = {xCenter-radius-pert, yCenter, 0,hole}; // left
Point(5) = {xCenter+radius+pert, yCenter, 0,hole}; // right
Ellipse(1) = {2, 1, 1, 5};
Ellipse(2) = {5, 1, 1, 3};
Ellipse(3) = {3, 1, 1, 4};
Ellipse(4) = {4, 1, 1, 2};

Point(6) = { 0.0*L, 1.0*L, 0.0, wall};
Point(7) = { 3.0*L, 1.0*L, 0.0, wall};
Point(8) = { 0.0*L, 0.0*L, 0.0, wall};
Point(9) = { 3.0*L, 0.0*L, 0.0, wall};

l = newl;
Line(l) = {6, 8};
b = newl;
Line(b) = {8, 9};
r = newl;
Line(r) = {9, 7};
t = newl;
Line(t) = {7, 6};

Physical Line('wallNoSlipVar') = {t};
Physical Line('wallNoSlipConst') = {b};
Physical Line('wallInflowU') = {l};
Physical Line('wallOutflow') = {r};
Physical Line('wallHole') = {4, 1, 2, 3};
//+
