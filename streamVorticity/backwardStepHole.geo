
wall = 0.1;

L = 1.0;


/* 
 *              5         L+9L                4
 *         o -------------------------------- o         
 *         |                                  |       
 *    L    |                       _    _     |       
 *         |                      / \    | L  |       Y         
 *         o ---------- o         \_/   _|    | 2L    ^
 *         0          1 |                     |       |
 *              2*L     |                     |       |
 *         x(0,0)       o ------------------- o       o -----> X
 *                      2          9L         3
 * */

bubble = 0.1;
xCenter=1*L+9*L/3.0;
yCenter=L;
radius=0.5;
pert=(0.0/100)*radius;
Point(1) = {xCenter, yCenter, 0,bubble}; // center
Point(2) = {xCenter, yCenter+radius-pert, 0,bubble}; // up
Point(3) = {xCenter, yCenter-radius+pert, 0,bubble}; // down
Point(4) = {xCenter-radius-pert, yCenter, 0,bubble}; // left
Point(5) = {xCenter+radius+pert, yCenter, 0,bubble}; // right
Ellipse(1) = {2, 1, 1, 5};
Ellipse(2) = {5, 1, 1, 3};
Ellipse(3) = {3, 1, 1, 4};
Ellipse(4) = {4, 1, 1, 2};

Point(6)  = {0.0,     L, 0.0,  wall}; // p0
Point(7)  = {2*L,     L, 0.0,  wall}; // p1
Point(8)  = {2*L,   0.0, 0.0,  wall}; // p2
Point(9)  = {L+9*L, 0.0, 0.0,  wall}; // p3
Point(10)  = {L+9*L, 2*L, 0.0,  wall}; // p4
Point(11)  = {0.0  , 2*L, 0.0,  wall}; // p5

Line(5) = {6, 7};
Line(6) = {7, 8};
Line(7) = {8, 9};
Line(8) = {9, 10};
Line(9) = {10, 11};
Line(10) = {11, 6};

Physical Line('wallInflowU') = {10};
Physical Line('wallOutflow') = {8};
Physical Line('wallNoSlip') = {5, 6, 7};
Physical Line('wallNoSlipConst') = {9};
Physical Line('wallHole1') = {-4, -3, -2, -1};

