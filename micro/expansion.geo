

wall=0.1;

Point(1) = {1, 0.5, 0.0, wall};
Point(2) = {3, 0.5, 0.0, wall};
Point(3) = {3, 0, 0.0, wall};
Point(4) = {5, 0, 0.0, wall};
Point(5) = {5, 2, 0.0, wall};
Point(6) = {3, 2, 0.0, wall};
Point(7) = {3, 1.5, 0.0, wall};
Point(8) = {1, 1.5, 0.0, wall};

Line(1) = {1, 8};
Line(2) = {8, 7};
Line(3) = {7, 6};
Line(4) = {6, 5};
Line(5) = {5, 4};
Line(6) = {4, 3};
Line(7) = {3, 2};
Line(8) = {2, 1};
Physical Line('wall') = {8, 1, 2, 3, 4, 5, 6, 7};
