
wall = 0.07;

L = 2*Pi;

/* 
 *              3               2
 *              o ------------- o    Y           
 *              |               |    ^
 *          L   |               |    |
 *              |               |    |
 *              o ------------- o     ------> X
 *              0      3*L      1
 *
 * */

Point(0) = {0.0, 0.0, 0.0,  wall}; // p0
Point(1) = {L,   0.0, 0.0,  wall}; // p1
Point(2) = {L,L, 0.0,  wall}; // p2
Point(3) = {0.0,   L, 0.0,  wall}; // p3

Line(1) = {0, 1};
Line(2) = {1, 2};
Line(3) = {2, 3};
Line(4) = {3, 0};
Physical Line('wallNormalU') = {2, 4};
Physical Line('wallNormalV') = {1, 3};
