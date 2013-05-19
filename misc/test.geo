// Gmsh project created on Fri Feb  6 14:28:22 2009

bubble = 0.1;
wall = 0.6;
xCenter=2;
yCenter=2;
radius=0.5;
pert=(0.0/100)*radius;
Point(1) = {xCenter, yCenter, 0,bubble}; // center
Point(2) = {xCenter, yCenter+radius-pert, 0,bubble}; // up
Point(3) = {xCenter, yCenter-radius+pert, 0,bubble}; // down
Point(4) = {xCenter-radius-pert, yCenter, 0,bubble}; // left
Point(5) = {xCenter+radius+pert, yCenter, 0,bubble}; // right
Ellipse(1) = {2, 1, 1, 5};
Ellipse(2) = {5, 1, 1, 3};
Ellipse(3) = {3, 1, 1, 4};
Ellipse(4) = {4, 1, 1, 2};

Point(6) = {0, 0, 0,wall};
Point(7) = {4, 0, 0,wall};
Point(8) = {4, 5, 0,bubble};
Point(9) = {0, 5, 0,bubble};

Point(10) = {4, 7, 0,wall};
Point(11) = {0, 7, 0,wall};

Line(5) = {6, 7};
Line(6) = {7, 8};
Line(7) = {9, 6};
Line(8) = {9, 8};
Line(9) = {8, 10};
Line(10) = {10, 11};
Line(11) = {11, 9};
Physical Line('wall') = {7, 5, 6};
Physical Line('bubble1') = {11, 8, 9, 10};
Physical Line('bubble2') = {1, 4, 3, 2};
