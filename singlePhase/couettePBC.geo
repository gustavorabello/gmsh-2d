// Gmsh project created on Thu Jun  4 09:24:57 2009

wall = 0.3;

Point(1) = {0, 0, 0, wall};
Point(2) = {0, 1, 0, wall};
Point(3) = {3, 1, 0, wall};
Point(4) = {3, 0, 0, wall};
Line(1) = {2, 3};
Line(2) = {3, 4};
Line(3) = {4, 1};
Line(4) = {1, 2};
Line Loop(5) = {1, 2, 3, 4};
Plane Surface(6) = {5};

Transfinite Line {1, 3} = 30 Using Progression 1;
Transfinite Line {4, 2} = 5 Using Progression 1;


Periodic Line {2} = {-4};
Physical Line('wallNoSlip') = {1};
Physical Line('wallNoSlipPressure') = {3};
Physical Line('wallLeft') = {4};
Physical Line('wallRight') = {2};

//Physical Line('wallNoSlip') = {1, 3};
//Physical Line('wallInflowU') = {4};
//Physical Line('wallOutflow') = {2};
//Physical Line('wallNoSlipConcentration') = {1, 3};
