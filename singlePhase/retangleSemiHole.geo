
wall = 0.1;
hole = 0.1;

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

xCenter=8*L/2.0;
yCenter=0;
radius=0.5;
pert=(20.0/100)*radius;
Point(1) = {xCenter, yCenter,             0,hole}; // center
Point(2) = {xCenter, yCenter+radius-pert, 0,hole}; // up
Point(3) = {xCenter-radius-pert, yCenter, 0,hole}; // left
Point(4) = {xCenter+radius+pert, yCenter, 0,hole}; // right
Ellipse(1) = {2, 1, 1, 4};
Ellipse(2) = {3, 1, 1, 2};

Point(6)  = {0.0, 0.0, 0.0,  wall}; // p0
Point(7)  = {8*L, 0.0, 0.0,  wall}; // p3
Point(8)  = {8*L, 2*L, 0.0,  wall}; // p4
Point(9)  = {0.0, 2*L, 0.0,  wall}; // p5

Line(3) = {6, 3};
Line(4) = {4, 7};
Line(5) = {7, 8};
Line(6) = {8, 9};
Line(7) = {9, 6};

//+ required by 2d mesh
Line Loop(1) = {3, 2, 1, 4, 5, 6, 7};
Plane Surface(1) = {1};

/*--------------------------------------------------
 * //+ boundary conditions for potential
 * Physical Line('wallPhiY') = {7, 5};
 * Physical Line('wallPhiBottom') = {3, 2, 1, 4};
 * Physical Line('wallPhiTop') = {6};
 * --------------------------------------------------*/

//+ boundary conditions for stream function
Physical Line('wallPsiY') = {7, 5};
Physical Line('wallPsiBottom') = {3, 2, 1, 4};
Physical Line('wallPsiTop') = {6};

//+
Physical Surface(4) = {1};
