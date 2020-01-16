
wall = 0.07;

L = 6;

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

Point(0) = {-L/2.0, -L/2.0, 0,wall};
Point(1) = {L/2.0, -L/2.0, 0,wall};
Point(2) = {L/2.0, L/2.0, 0,wall};
Point(3) = {-L/2.0, L/2.0, 0,wall};

Line(1) = {0, 1};
Line(2) = {1, 2};
Line(3) = {2, 3};
Line(4) = {3, 0};
Physical Line('wallNormalU') = {2, 4};
Physical Line('wallNormalV') = {1, 3};
