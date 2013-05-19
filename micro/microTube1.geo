// Gmsh project created on Fri Feb  6 14:28:22 2009

// wall
lc=0.04;
Point(1) = {0, 0, 0,lc};
Point(2) = {1, 0, 0,lc};
Point(3) = {1, 10, 0,lc};
Point(4) = {0, 10, 0,lc};

// bubble
lc=0.04;
Point(5) = {0.2, 0.5, 0,lc};
Point(6) = {0.8, 0.5, 0,lc};
Point(7) = {0.2, 1.5, 0,lc};
Point(8) = {0.8, 1.5, 0,lc};
Point(9) = {0.5, 1.5, 0,lc};
Point(10) = {0.5, 1.8, 0,lc};
Line(1) = {8, 6};
Line(2) = {6, 5};
Line(3) = {5, 7};
Circle(4) = {7, 9, 10};
Circle(5) = {10, 9, 8};
Line(6) = {3, 2};
Line(7) = {2, 1};
Line(8) = {1, 4};
Line(9) = {4, 3};

Physical Line('wall') = {6, 7, 8, 9};
Physical Line('bubble') = {1, 2, 3, 4, 5};
