
wall = 0.08;
hole = 0.05;

L = 1.0;


/* 
 *        4                 9L                 3
 *         o -------------------------------- o         
 *         |                                  |       
 *         |                       _    _     |       
 *      2L |                      / \    | L  |       Y         
 *         |                      \_/   _|    | 2L    ^
 *         |                                  |       |
 *         |                                  |       |
 *      1  o -------------------------------- o       o -----> X
 *         x(0,0)           9L                 2
 * */

bubble = 0.1;
xCenter=1*L+9*L/3.0;
yCenter=0;
radius=0.5;
pert=-(00.0/100)*radius;
Point(1) = {xCenter, yCenter, 0,hole}; // center
Point(2) = {xCenter, yCenter+radius-pert, 0,hole}; // up
Point(3) = {xCenter, yCenter-radius+pert, 0,hole}; // down
Point(4) = {xCenter-radius-pert, yCenter, 0,hole}; // left
Point(5) = {xCenter+radius+pert, yCenter, 0,hole}; // right
Ellipse(1) = {2, 1, 1, 5};
Ellipse(2) = {5, 1, 1, 3};
Ellipse(3) = {3, 1, 1, 4};
Ellipse(4) = {4, 1, 1, 2};

Point(6)  = {0.0,  -3*L, 0.0,  wall}; // p1
Point(7)  = {15*L, -3*L, 0.0,  wall}; // p2
Point(8)  = {15*L,  3*L, 0.0,  wall}; // p3
Point(9)  = {0.0,   3*L, 0.0,  wall}; // p4

Line(5) = {7, 6};
Line(6) = {8, 7};
Line(7) = {9, 8};
Line(8) = {6, 9};

//+
Physical Line('wallNormalV') = {5,7};
Physical Line('wallInflowU') = {8};
Physical Line('wallOutflow') = {6};
Physical Line('wallHole1') = {3, 2, 1, 4}; // moving hole
//Physical Line('wallNoSlip') = {3, 2, 1, 4}; // static hole

