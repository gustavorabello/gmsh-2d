
wall = 0.3;
hole = 0.3;

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

Point(6)  = {0.0, 0.0, 0.0,  wall}; // p0
Point(7)  = {8*L, 0.0, 0.0,  wall}; // p3
Point(8)  = {8*L, 2*L, 0.0,  wall}; // p4
Point(9)  = {0.0, 2*L, 0.0,  wall}; // p5

Line(5) = {6, 7};
Line(6) = {7, 8};
Line(7) = {8, 9};
Line(8) = {9, 6};

//+
Line Loop(1) = {7, 8, 5, 6};
Plane Surface(1) = {1};

/*--------------------------------------------------
 * //+ boundary conditions potential
 * Physical Line('wallPhiY') = {8, 6};
 * Physical Line('wallPhiBottom') = {5};
 * Physical Line('wallPhiTop') = {7};
 * --------------------------------------------------*/

//+ boundary conditions for stream function
Physical Line('wallPsiY') = {8, 6};
Physical Line('wallPsiBottom') = {5};
Physical Line('wallPsiTop') = {7};


Physical Surface(1) = {1};
