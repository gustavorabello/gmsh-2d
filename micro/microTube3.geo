// Gmsh project created on Fri Feb  6 14:28:22 2009

// wall
lc=0.04;
Point(1) = {0, 0, 0,lc};
Point(2) = {1, 0, 0,lc};
Point(3) = {1, 20, 0,lc};
Point(4) = {0, 20, 0,lc};

// bubble
lc=0.03;
yorig=0.5;
lenght=1.0;
Point(5)  = {0.1, yorig, 0,lc};
Point(6)  = {0.9, yorig, 0,lc};
Point(7)  = {0.1, yorig+lenght, 0,lc};
Point(8)  = {0.9, yorig+lenght, 0,lc};
Point(9)  = {0.5, yorig+lenght, 0,lc};
Point(10) = {0.5, yorig+lenght+0.4, 0,lc};
Line(1) = {8, 6};
Line(2) = {6, 5};
Line(3) = {5, 7};
Circle(4) = {7, 9, 10};
Circle(5) = {10, 9, 8};
Line(6) = {3, 2};
Line(7) = {2, 1};
Line(8) = {1, 4};
Line(9) = {4, 3};

// bubble
lc=0.03;
yorig=1.95;
lenght=0.5;
Point(11) = {0.1, yorig, 0,lc};
Point(12) = {0.9, yorig, 0,lc};
Point(13) = {0.1, yorig+lenght, 0,lc};
Point(14) = {0.9, yorig+lenght, 0,lc};
Point(15) = {0.5, yorig+lenght, 0,lc};
Point(16) = {0.5, yorig+lenght+0.4, 0,lc};
Line(10) = {14, 12};
Line(11) = {12, 11};
Line(12) = {11, 13};
Circle(13) = {13, 15, 16};
Circle(14) = {16, 15, 14};

// bubble
lc=0.03;
yorig=2.9;
lenght=1.0;
Point(17) = {0.1, yorig, 0,lc};
Point(18) = {0.9, yorig, 0,lc};
Point(19) = {0.1, yorig+lenght, 0,lc};
Point(20) = {0.9, yorig+lenght, 0,lc};
Point(21) = {0.5, yorig+lenght, 0,lc};
Point(22) = {0.5, yorig+lenght+0.4, 0,lc};

Line(15) = {20, 18};
Line(16) = {18, 17};
Line(17) = {17, 19};
Circle(18) = {19, 21, 22};
Circle(19) = {22, 21, 20};

Physical Line('wall') = {8, 9, 6, 7};
Physical Line('bubble1') = {2, 3, 4, 5, 1};
Physical Line('bubble2') = {11, 12, 13, 14, 10};
Physical Line('bubble3') = {16, 17, 18, 19, 15};
