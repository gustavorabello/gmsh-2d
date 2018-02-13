// Gmsh project created on Thu Jun  4 09:24:57 2009

//r1 = 0.005; 
//r2 = 0.007; 
r1 = 0.0022; 
r2 = 0.0032; 
material = 0.0002;
wall = 0.1;

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
Line(1) = {2, 3};
Line(2) = {3, 4};
Line(3) = {4, 1};
Line(4) = {1, 2};

Transfinite Line {1, 3} = 100/(4*wall) Using Progression 1;
Transfinite Line {4, 2} = 20/(3*wall) Using Progression 1;

Point(5)  = {   xc,    yc, 0, material};
Point(6)  = {   xc, yc+r1, 0, material};
Point(7)  = {xc+r1,    yc, 0, material};
Point(8)  = {   xc, yc-r1, 0, material};
Point(9)  = {xc-r1,    yc, 0, material};
Point(10) = {   xc, yc+r2, 0, material};
Point(11) = {xc+r2,    yc, 0, material};
Point(12) = {   xc, yc-r2, 0, material};
Point(13) = {xc-r2,    yc, 0, material};
                                   
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
