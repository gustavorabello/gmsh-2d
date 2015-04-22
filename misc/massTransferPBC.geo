// Gmsh project created on Fri Feb  6 14:28:22 2009
Mesh.Points = 1;
Mesh.Lines = 1;

b1 = 0.1;
w1 = 0.14;
Point(1) = {0, 0, 0, w1};
Point(2) = {1, 0, 0, w1};
Point(3) = {1, 0.5, 0, b1};
Point(4) = {1, 1, 0, w1};
Point(5) = {0, 1, 0, b1};
Point(6) = {0, 0.5, 0, w1};
Line(1) = {1, 2};
Line(2) = {2, 3};
Line(3) = {3, 6};
Line(4) = {3, 4};
Line(5) = {5, 6};
Line(6) = {4, 5};
Line(7) = {6, 1};

Periodic Line {2,4} = {-7,-5};

//Physical Line('wallNormalY') = {6};
//Physical Line('wallNoSlip') = {6};
//Physical Line('wallNoSlipPressure') = {1};
Physical Line('wallNoSlip') = {6,1};
Physical Line('wallLeft') = {5,7};
Physical Line('wallRight') = {2,4};
Physical Line('bubble1') = {3};

