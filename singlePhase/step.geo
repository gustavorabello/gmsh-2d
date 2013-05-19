// wall
wall = 0.1;
Point(1) = {0, 0, 0, wall};
Point(2) = {4, 0, 0, wall};
Point(3) = {4, 2, 0, wall};
Point(4) = {0, 2, 0, wall};
Line(1) = {1, 2};
Line(2) = {2, 3};
Line(3) = {3, 4};
Line(4) = {4, 1};
Physical Line('wall') = {3, 4, 1, 2};
