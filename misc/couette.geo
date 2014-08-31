// Gmsh project created on Thu Jun  4 09:24:57 2009
Point(1) = {0, 0, 0};
Point(2) = {0, 1, 0};
Point(3) = {5, 1, 0};
Point(4) = {5, 0, 0};
Line(1) = {2, 3};
Line(2) = {3, 4};
Line(3) = {4, 1};
Line(4) = {1, 2};
Line Loop(5) = {1, 2, 3, 4};

Physical Line('wallInflowU') = {4};
Physical Line('wallOutflow') = {2};
Physical Line('wallNoSlipConcentration') = {1, 3};

Transfinite Line {3, 1} = 40 Using Progression 1;
Transfinite Line {4, 2} = 10 Using Progression 1;
