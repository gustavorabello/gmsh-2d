// Gmsh project created on Fri Feb  6 14:28:22 2009

b1 = 0.01;
w1 = 0.005;
Point(1) = {0, 0, 0, w1};
Point(2) = {1, 0, 0, w1};
Point(3) = {1, 0.5, 0, b1};
Point(4) = {1, 1, 0, w1};
Point(5) = {0, 1, 0, b1};
Point(6) = {0, 0.5, 0, w1};
Line(1) = {1, 2};
Line(2) = {2, 3};
Line(3) = {3, 6};
Line(4) = {6, 1};
Line(5) = {3, 4};
Line(6) = {4, 5};
Line(7) = {5, 6};

Physical Line('wallNormalY') = {1, 2, 5, 6, 7, 4};
Physical Line('bubble1') = {3};
