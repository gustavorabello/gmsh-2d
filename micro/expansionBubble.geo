

wall=0.05;

Point(1) = {1, 0.5, 0.0, wall};
Point(2) = {8, 0.5, 0.0, wall};
Point(3) = {8, 0, 0.0, wall};
Point(4) = {20, 0, 0.0, wall};
Point(5) = {20, 2, 0.0, wall};
Point(6) = {8, 2, 0.0, wall};
Point(7) = {8, 1.5, 0.0, wall};
Point(8) = {1, 1.5, 0.0, wall};

b1=0.05;
Point(9) = {1.6, 0.7, 0, b1};
Point(10) = {1.6, 1.3, 0, b1};
Point(11) = {2.6, 1.3, 0, b1};
Point(12) = {2.6, 0.7, 0, b1};
Point(13) = {2.6, 1, 0, b1};
Point(14) = {2.9, 1, 0, b1};
Line(1) = {1, 8};
Line(2) = {8, 7};
Line(3) = {7, 6};
Line(4) = {6, 5};
Line(5) = {5, 4};
Line(6) = {4, 3};
Line(7) = {3, 2};
Line(8) = {2, 1};
Line(9) = {12, 9};
Line(10) = {9, 10};
Line(11) = {10, 11};
Circle(12) = {11, 13, 14};
Circle(13) = {14, 13, 12};
Physical Line('wall') = {8, 1, 2, 3, 4, 5, 6, 7};
Physical Line('bubble') = {9, 10, 11, 12, 13};
