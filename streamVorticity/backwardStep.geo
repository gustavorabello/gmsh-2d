
wall = 0.1;

L = 1.0;


/* 
 *              5         L+3L          4
 *              o --------------------- o         
 *              |                       |       
 *         L    |                       |       
 *              |                       |       Y         
 *              o ----- o               | 2L    ^
 *              0     1 |               |       |
 *                  L   |               |       |
 *              x(0,0)  o ------------- o       o -----> X
 *                      2      3L       3
 * */

Point(0)  = {0.0,     L, 0.0,  wall}; // p0
Point(1)  = {1*L,     L, 0.0,  wall}; // p1
Point(2)  = {1*L,   0.0, 0.0,  wall}; // p2
Point(3)  = {L+6*L, 0.0, 0.0,  wall}; // p3
Point(4)  = {L+6*L, 2*L, 0.0,  wall}; // p4
Point(5)  = {0.0  , 2*L, 0.0,  wall}; // p5


Line(1) = {0, 1};
Line(2) = {1, 2};
Line(3) = {2, 3};
Line(4) = {3, 4};
Line(5) = {4, 5};
Line(6) = {5, 0};

Physical Line('wallInflowU') = {6};
Physical Line('wallOutflow') = {4};
Physical Line('wallNoSlip') = {1,2,3};
Physical Line('wallNoSlipConst') = {5};
