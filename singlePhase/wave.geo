

f = 2.45e+09;
c = 3.00e+08;
lambda = c/f;
L = lambda;

wall = L/10.0;

/* 
 *              3               2
 *       -      o ------------- o    Y           
 *       |      |               |    ^
 *     L |    4 o               |    |
 *       |      |               |    |
 *       -      o ------------- o     ------> X
 *              0               1
 *              
 *              |______1.5*L____|
 *              
 * */

Point(0) = {0.0,   0.0, 0.0,  wall}; // p0
Point(1) = {1.5*L, 0.0, 0.0,  wall}; // p1
Point(2) = {1.5*L,   L, 0.0,  wall}; // p2
Point(3) = {0.0,     L, 0.0,  wall}; // p3
Point(4) = {0.0, 0.5*L, 0.0,  wall}; // p4

Line(1) = {0, 1};
Line(2) = {1, 2};
Line(3) = {2, 3};
Line(4) = {3, 4};
Line(5) = {4, 0};

Physical Line('wallSource') = {4};
Physical Line('wallWall') = {1,2,3,5};
