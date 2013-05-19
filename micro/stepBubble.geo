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

// bubble
bubble = 0.05;
Point(5) = {2, 1.4, 0, bubble};
Point(6) = {2, 1.1, 0, bubble};
Point(7) = {2, 0.8, 0, bubble};
Point(8) = {2.3, 1.1, 0, bubble};
Point(9) = {1.7, 1.1, 0, bubble};
Circle(5) = {5, 6, 8};
Circle(6) = {8, 6, 7};
Circle(7) = {7, 6, 9};
Circle(8) = {9, 6, 5};

Physical Line('wall') = {3, 4, 1, 2};
Physical Line('bubble') = {5, 8, 7, 6};
