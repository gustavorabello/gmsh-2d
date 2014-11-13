// Gmsh project created on Thu Jun  4 09:24:57 2009

r1 = 0.005; 
r2 = 0.007; 
material = 0.001;
wall = 0.6;

Point(1) = {0, 0.00, 0, wall};
Point(2) = {0, 0.05, 0, wall};
Point(3) = {0.1875, 0.05, 0, wall};
Point(4) = {0.1875, 0.00, 0, wall};
Line(1) = {2, 3};
Line(2) = {3, 4};
Line(3) = {4, 1};
Line(4) = {1, 2};

Transfinite Line {1, 3} = 100 Using Progression 1;
Transfinite Line {4, 2} = 20 Using Progression 1;

Point(5)  = {   0.16,    0.025, 0, material};
Point(6)  = {   0.16, 0.025+r1, 0, material};
Point(7)  = {0.16+r1,    0.025, 0, material};
Point(8)  = {   0.16, 0.025-r1, 0, material};
Point(9)  = {0.16-r1,    0.025, 0, material};
Point(10) = {   0.16, 0.025+r2, 0, material};
Point(11) = {0.16+r2,    0.025, 0, material};
Point(12) = {   0.16, 0.025-r2, 0, material};
Point(13) = {0.16-r2,    0.025, 0, material};
                                   
Ellipse(7) = {6, 5, 5, 7};
Ellipse(8) = {7, 5, 5, 8};
Ellipse(9) = {8, 5, 5, 9};
Ellipse(10) = {9, 5, 5, 6};

Ellipse(11) = {10, 5, 5, 11};
Ellipse(12) = {11, 5, 5, 12};
Ellipse(13) = {12, 5, 5, 13};
Ellipse(14) = {13, 5, 5, 10};

Physical Line('wallSource') = {-4};
Physical Line('wallNoSlip') = {-1, -2, -3};
Physical Line('material1') = {-11, -12, -13, -14};
Physical Line('material2') = {-7, -8, -9, -10};
