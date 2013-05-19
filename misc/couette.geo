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
Plane Surface(6) = {5};
Transfinite Line {2, 4} = 50 Using Bump 1;
Transfinite Line {2, 4} = 50 Using Progression 1;
