// Gmsh project created on Thu Jun  4 09:24:57 2009

//r1 = 0.005; 
//r2 = 0.007; 
r1 = 0.01; 
r2 = 0.04; 
material = 0.001;
wall = 0.001;

// Nondimensional coordinates 
xmin = 0.0;
xmax = 0.1875;
ymin = 0.00;
ymax = 0.05;

//xc = 0.177;
xc = xmax/2.0;
yc = ymax/2.0;

Point(1) = {xmin, ymin, 0, wall};
Point(2) = {xmin, ymax, 0, wall};
Point(3) = {xmax, ymax, 0, wall};
Point(4) = {xmax, ymin, 0, wall};

Point(5) = {xmax-r1-r2, ymin, 0, material};
Point(6) = {xmax-r2, ymin, 0, material};

Point(7) = {xmax-r1-r2, ymax, 0, material};
Point(8) = {xmax-r2, ymax, 0, material};

Line(1) = {1, 2};
Line(2) = {2, 7};
Line(3) = {7, 8};
Line(4) = {8, 3};
Line(5) = {3, 4};
Line(6) = {4, 6};
Line(7) = {6, 5};
Line(8) = {5, 1};
Line(9) = {5, 7};
Line(10) = {8, 6};

Physical Line('wallSource') = {-1};
Physical Line("wallNoSlip") = {-2,-8};
Physical Line("material1") = {9,10,-3,-7};
Physical Line("material2") = {-4,-5,-6};
